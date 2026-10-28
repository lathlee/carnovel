package com.lath.carnotifyserver;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.view.Gravity;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Collections;
import java.util.List;

/**
 * 主界面：显示车机地址、服务状态、操作提示。
 * 打开后自动拉起后台服务。
 */
public class MainActivity extends Activity {

    private TextView tv;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(Color.parseColor("#070b07"));
        root.setPadding(48, 64, 48, 48);

        tv = new TextView(this);
        tv.setTextSize(17f);
        tv.setTextColor(Color.WHITE);
        tv.setLineSpacing(8f, 1f);
        root.addView(tv);

        setContentView(root);

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
        StringBuilder sb = new StringBuilder();
        sb.append("CarNotify 服务\n\n");
        sb.append("状态：").append(ServerService.running ? "运行中 ✓" : "未运行 ✗").append("\n\n");

        sb.append("车机本机地址：\n");
        sb.append("  http://127.0.0.1:").append(ServerService.PORT).append("\n");
        List<String> ips = localIps();
        for (String ip : ips) {
            sb.append("  http://").append(ip).append(":").append(ServerService.PORT).append("\n");
        }
        sb.append("\n");

        sb.append("① 在 APTV 浏览器打开：\n");
        sb.append("   http://127.0.0.1:").append(ServerService.PORT).append("\n\n");

        sb.append("② iPhone 快捷指令 POST 到：\n");
        String lan = ips.isEmpty() ? "192.168.43.1" : ips.get(0);
        sb.append("   http://").append(lan).append(":").append(ServerService.PORT).append("/push\n");
        sb.append("   （填车机热点网关那个 IP）\n\n");

        int n = ServerService.instance != null ? ServerService.instance.count() : 0;
        sb.append("当前消息数：").append(n).append("\n\n");
        sb.append("提示：在车机「设置 → 自启动管理 / 后台白名单」\n把本应用加进去，防止被系统杀掉。");

        tv.setText(sb.toString());
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
