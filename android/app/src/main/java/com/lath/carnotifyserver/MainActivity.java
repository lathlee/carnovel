package com.lath.carnotifyserver;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.text.Html;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Collections;
import java.util.List;

/**
 * 主界面：只显示一份最简洁的配置教程（4 步）+ 当前地址。
 * 打开后自动拉起后台服务。地址里的 IP 运行时从网卡取，绝不写死。
 */
public class MainActivity extends Activity {

    private TextView tv;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        ScrollView sv = new ScrollView(this);
        sv.setBackgroundColor(Color.parseColor("#070b07"));

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(30, 26, 30, 20);

        tv = new TextView(this);
        tv.setTextSize(15f);
        tv.setTextColor(Color.WHITE);
        tv.setLineSpacing(6f, 1f);
        root.addView(tv);

        sv.addView(root);
        setContentView(sv);

        // 拉起后台服务（重复调用无害）
        try {
            startService(new Intent(this, ServerService.class));
        } catch (Exception ignored) {
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        render();
        tv.postDelayed(new Runnable() {
            @Override
            public void run() {
                if (!isFinishing()) {
                    render();
                    tv.postDelayed(this, 2000);
                }
            }
        }, 2000);
    }

    private void render() {
        List<String> ips = localIps();
        String lan = ips.isEmpty() ? "192.168.43.1" : ips.get(0);
        String base = "http://" + lan + ":" + ServerService.PORT;

        final String G = "#3fb950";   // 绿：状态 / 步骤号
        final String H = "#7ee787";   // 亮绿：地址
        final String M = "#8ba08c";   // 次要灰绿
        final String D = "#6e826f";   // 更淡的说明

        StringBuilder h = new StringBuilder();
        h.append("<font color='#ffffff'><b>CarNotify</b></font> ")
                .append("<font color='").append(M).append("'>车机通知服务</font><br/><br/>");

        h.append("<font color='").append(G).append("'>● ")
                .append(ServerService.running ? "服务运行中" : "服务未运行").append("</font>")
                .append("<font color='").append(M).append("'> · 当前地址 </font>")
                .append("<font color='").append(H).append("'>").append(lan).append(":")
                .append(ServerService.PORT).append("</font><br/><br/>");

        h.append("<font color='#1e2a1e'>────────────────────</font><br/><br/>");

        h.append(step(1,
                "<b>iPhone 连接车机热点</b>（与车机同一网络）"));

        h.append(step(2,
                "<b>快捷指令 → 自动化 →「收到通知」</b>",
                "选 App「微信」，关掉「运行前询问」",
                "添加「词典」：<font color='" + H + "'>app=微信，title=通知标题，body=通知内容</font>",
                "添加「获取 URL 内容」：<font color='" + H + "'>" + base + "/push</font>",
                "<font color='" + M + "'>方法 POST · 请求体 JSON = 上面的词典</font>",
                "<font color='" + M + "'>短信再建一条，app 改成「短信」</font>"));

        h.append(step(3,
                "<b>车机 CARTV 打开</b>",
                "<font color='" + H + "'>" + base + "</font>",
                "<font color='" + M + "'>就是上面「当前地址」；IP 可能会变，以屏幕显示为准</font>"));

        h.append(step(4,
                "<b>完成。</b>通知到达 → 车机响铃 + 页面显示"));

        h.append("<font color='").append(D)
                .append("'><small>若重启后收不到：设置 → 自启动 / 后台白名单，允许本应用</small></font>");

        tv.setText(Html.fromHtml(h.toString()));
    }

    /** 一个步骤：绿色圈号 + 首行加粗，后续行缩进 */
    private String step(int n, String... lines) {
        String[] cir = {"①", "②", "③", "④"};
        StringBuilder sb = new StringBuilder();
        sb.append("<font color='#3fb950'><b>").append(cir[n - 1]).append("</b></font> ")
                .append(lines[0]).append("<br/>");
        for (int i = 1; i < lines.length; i++) {
            sb.append("&nbsp;&nbsp;&nbsp;&nbsp;").append(lines[i]).append("<br/>");
        }
        sb.append("<br/>");
        return sb.toString();
    }

    /** 列出本机所有非回环 IPv4 地址 */
    private List<String> localIps() {
        java.util.ArrayList<String> out = new java.util.ArrayList<String>();
        try {
            List<NetworkInterface> nis = Collections.list(NetworkInterface.getNetworkInterfaces());
            for (NetworkInterface ni : nis) {
                if (!ni.isUp() || ni.isLoopback()) continue;
                for (InetAddress a : Collections.list(ni.getInetAddresses())) {
                    if (a instanceof Inet4Address && !a.isLoopbackAddress()) {
                        String ip = a.getHostAddress();
                        if (ip != null && !out.contains(ip)) out.add(ip);
                    }
                }
            }
        } catch (Exception ignored) {
        }
        // 热点网关通常排前面
        java.util.Collections.sort(out, new java.util.Comparator<String>() {
            @Override
            public int compare(String a, String b) {
                boolean ha = a.startsWith("192.168."), hb = b.startsWith("192.168.");
                if (ha && !hb) return -1;
                if (!ha && hb) return 1;
                return a.compareTo(b);
            }
        });
        return out;
    }
}
