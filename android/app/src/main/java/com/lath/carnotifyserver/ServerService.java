package com.lath.carnotifyserver;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Intent;
import android.media.AudioManager;
import android.media.ToneGenerator;
import android.os.Build;
import android.os.IBinder;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import fi.iki.elonen.NanoHTTPD;

/**
 * 常驻后台服务：
 *  - 在 0.0.0.0:8080 起一个 HTTP 服务
 *  - POST /push   接收 iPhone 快捷指令推送，存下来并在车机本地响一声
 *  - GET  /latest 给页面轮询（返回最新消息，新的在前）
 *  - POST /clear  清屏
 *  - GET  /       返回内置页面（APTV 浏览器打开）
 *
 * 保活：前台服务 + 开机自启 + AlarmManager 看门狗（见 WatchdogReceiver）
 */
public class ServerService extends Service {

    static final String TAG = "CarNotifyServer";
    static final int PORT = 8080;
    static final int MAX_MSG = 100;

    static volatile boolean running = false;
    static ServerService instance = null;

    private HttpServer server;
    private ToneGenerator tone;
    private final List<JSONObject> msgs = new ArrayList<JSONObject>();
    private long nextId = 1;
    private File store;

    @Override
    public void onCreate() {
        super.onCreate();
        instance = this;
        store = new File(getFilesDir(), "messages.json");
        load();
        startForegroundCompat();
        startServer();
        running = true;
        WatchdogReceiver.schedule(this);
        Log.i(TAG, "service created, port=" + PORT);
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        return START_STICKY;
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public void onDestroy() {
        running = false;
        instance = null;
        try {
            if (server != null) server.stop();
        } catch (Exception ignored) {
        }
        try {
            if (tone != null) tone.release();
        } catch (Exception ignored) {
        }
        super.onDestroy();
    }

    // ---------------- 前台通知 ----------------

    private void startForegroundCompat() {
        String ch = "carnotify";
        Notification.Builder b;
        if (Build.VERSION.SDK_INT >= 26) {
            NotificationManager nm = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);
            NotificationChannel c = new NotificationChannel(ch, "CarNotify", NotificationManager.IMPORTANCE_LOW);
            nm.createNotificationChannel(c);
            b = new Notification.Builder(this, ch);
        } else {
            b = new Notification.Builder(this);
        }
        b.setContentTitle("CarNotify 服务运行中")
                .setContentText("监听端口 " + PORT)
                .setSmallIcon(android.R.drawable.stat_sys_download_done)
                .setOngoing(true);
        startForeground(1001, b.build());
    }

    private void startServer() {
        try {
            server = new HttpServer(PORT);
            server.start(NanoHTTPD.SOCKET_READ_TIMEOUT, false);
            Log.i(TAG, "http started on " + PORT);
        } catch (IOException e) {
            Log.e(TAG, "http start failed", e);
        }
    }

    // ---------------- 消息存储 ----------------

    synchronized void load() {
        try {
            if (!store.exists()) return;
            String s = readAll(store);
            if (s == null || s.length() == 0) return;
            JSONArray arr = new JSONArray(s);
            for (int i = 0; i < arr.length(); i++) {
                JSONObject o = arr.getJSONObject(i);
                msgs.add(o);
                nextId = Math.max(nextId, o.optLong("id", 0) + 1);
            }
        } catch (Exception e) {
            Log.w(TAG, "load failed", e);
        }
    }

    synchronized void save() {
        try {
            JSONArray arr = new JSONArray();
            for (JSONObject o : msgs) arr.put(o);
            FileOutputStream fos = new FileOutputStream(store);
            fos.write(arr.toString().getBytes("UTF-8"));
            fos.close();
        } catch (Exception e) {
            Log.w(TAG, "save failed", e);
        }
    }

    synchronized JSONArray latest() {
        JSONArray arr = new JSONArray();
        for (int i = msgs.size() - 1; i >= 0; i--) arr.put(msgs.get(i));
        return arr;
    }

    synchronized int count() {
        return msgs.size();
    }

    synchronized long push(JSONObject o) {
        long id = nextId++;
        try {
            o.put("id", id);
            msgs.add(o);
            while (msgs.size() > MAX_MSG) msgs.remove(0);
            save();
        } catch (Exception e) {
            Log.w(TAG, "push failed", e);
        }
        return id;
    }

    synchronized void clearAll() {
        msgs.clear();
        save();
    }

    // ---------------- 提示音 ----------------

    void beep() {
        try {
            if (tone == null) tone = new ToneGenerator(AudioManager.STREAM_NOTIFICATION, 95);
            tone.startTone(ToneGenerator.TONE_PROP_BEEP, 180);
        } catch (Exception e) {
            try {
                tone = new ToneGenerator(AudioManager.STREAM_MUSIC, 95);
                tone.startTone(ToneGenerator.TONE_PROP_BEEP, 180);
            } catch (Exception ignored) {
            }
        }
    }

    // ---------------- HTTP ----------------

    private class HttpServer extends NanoHTTPD {
        HttpServer(int port) {
            super(port);
        }

        @Override
        public Response serve(IHTTPSession session) {
            String uri = session.getUri();
            try {
                if (session.getMethod() == Method.OPTIONS) {
                    Response r = newFixedLengthResponse(Response.Status.OK, "text/plain", "ok");
                    addCors(r);
                    return r;
                }
                if ("/".equals(uri) || "/index.html".equals(uri)) {
                    return serveIndex();
                }
                if ("/latest".equals(uri)) {
                    Response r = newFixedLengthResponse(Response.Status.OK,
                            "application/json; charset=utf-8", latest().toString());
                    r.addHeader("Cache-Control", "no-store");
                    addCors(r);
                    return r;
                }
                if ("/clear".equals(uri)) {
                    clearAll();
                    Response r = newFixedLengthResponse(Response.Status.OK,
                            "application/json; charset=utf-8", "{\"ok\":true}");
                    addCors(r);
                    return r;
                }
                if ("/health".equals(uri)) {
                    return newFixedLengthResponse(Response.Status.OK, "text/plain", "ok");
                }
                if ("/push".equals(uri)) {
                    return handlePush(session);
                }
            } catch (Exception e) {
                Log.e(TAG, "serve error", e);
                return newFixedLengthResponse(Response.Status.INTERNAL_ERROR, "text/plain", "error");
            }
            return newFixedLengthResponse(Response.Status.NOT_FOUND, "text/plain", "not found");
        }

        private Response serveIndex() throws IOException {
            InputStream in = getAssets().open("index.html");
            ByteArrayOutputStream bo = new ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) > 0) bo.write(buf, 0, n);
            in.close();
            byte[] data = bo.toByteArray();
            Response r = newFixedLengthResponse(Response.Status.OK, "text/html; charset=utf-8",
                    new ByteArrayInputStream(data), data.length);
            r.addHeader("Cache-Control", "no-store");
            return r;
        }

        private void addCors(Response r) {
            r.addHeader("Access-Control-Allow-Origin", "*");
            r.addHeader("Access-Control-Allow-Methods", "GET,POST,OPTIONS");
            r.addHeader("Access-Control-Allow-Headers", "Content-Type");
        }

        private Response handlePush(IHTTPSession session) {
            JSONObject o = new JSONObject();
            String raw = null;
            try {
                Map<String, String> files = new HashMap<String, String>();
                session.parseBody(files);
                String pd = files.get("postData");
                if (pd != null) {
                    File f = new File(pd);
                    if (f.exists() && f.isFile()) raw = readAll(f);
                    else raw = pd;
                }
            } catch (Exception ignored) {
            }

            try {
                if (raw != null && raw.trim().startsWith("{")) {
                    JSONObject j = new JSONObject(raw);
                    // 字段兜底与 iOS 端 NotifyServer 对齐：body 缺失时依次取 message / text；
                    // app 缺失时给"通知"，保证页面一定能归类显示（而不是静默丢弃）。
                    String app = j.optString("app", "");
                    String title = j.optString("title", "");
                    String body = firstNonEmpty(
                            j.optString("body", ""),
                            j.optString("message", ""),
                            j.optString("text", ""));
                    if (app.length() == 0) app = "通知";
                    o.put("app", app);
                    o.put("title", title);
                    o.put("body", body);
                    o.put("ts", fixTs(j.optLong("ts", 0)));
                } else if (raw != null && raw.indexOf('=') >= 0) {
                    fillFromQuery(o, raw);
                    o.put("ts", fixTs(o.optLong("ts", 0)));
                } else {
                    Map<String, String> parms = session.getParms();
                    if (parms != null && parms.size() > 0) {
                        o.put("app", str(parms.get("app")));
                        o.put("title", str(parms.get("title")));
                        o.put("body", str(parms.get("body")));
                        o.put("ts", fixTs(num(parms.get("ts"))));
                    } else {
                        o.put("app", "通知");
                        o.put("title", "");
                        o.put("body", raw == null ? "" : raw);
                        o.put("ts", fixTs(0));
                    }
                }
            } catch (Exception e) {
                try {
                    o.put("app", "");
                    o.put("title", "");
                    o.put("body", raw == null ? "" : raw);
                    o.put("ts", fixTs(0));
                } catch (Exception ignored) {
                }
            }

            long id = push(o);
            beep();

            Response r = newFixedLengthResponse(Response.Status.OK,
                    "application/json; charset=utf-8", "{\"ok\":true,\"id\":" + id + "}");
            addCors(r);
            return r;
        }

        private void fillFromQuery(JSONObject o, String q) throws Exception {
            String[] parts = q.split("&");
            for (String p : parts) {
                int i = p.indexOf('=');
                if (i < 0) continue;
                String k = decode(p.substring(0, i));
                String v = decode(p.substring(i + 1));
                if ("app".equals(k)) o.put("app", v);
                else if ("title".equals(k)) o.put("title", v);
                else if ("body".equals(k) || "message".equals(k)) o.put("body", v);
                else if ("ts".equals(k)) o.put("ts", num(v));
            }
        }

        private String decode(String s) {
            try {
                return java.net.URLDecoder.decode(s, "UTF-8");
            } catch (Exception e) {
                return s;
            }
        }

        private String str(String s) {
            return s == null ? "" : s;
        }

        private long num(String s) {
            try {
                return Long.parseLong(s);
            } catch (Exception e) {
                return 0;
            }
        }

        /** 返回第一个非空字符串（全空则返回空串） */
        private String firstNonEmpty(String... vals) {
            for (String v : vals) {
                if (v != null && v.length() > 0) return v;
            }
            return "";
        }

        private long fixTs(long ts) {
            if (ts <= 0) return System.currentTimeMillis() / 1000;
            if (ts > 100000000000L) return ts / 1000;   // 毫秒 → 秒
            return ts;
        }
    }

    // ---------------- 工具 ----------------

    private static String readAll(File f) {
        try {
            BufferedReader r = new BufferedReader(new InputStreamReader(new FileInputStream(f), "UTF-8"));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = r.readLine()) != null) sb.append(line).append('\n');
            r.close();
            return sb.toString();
        } catch (Exception e) {
            return null;
        }
    }
}
