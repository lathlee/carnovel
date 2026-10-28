package com.lath.carnotifyserver;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.SystemClock;

/**
 * 看门狗：每 2 分钟检查一次，服务被系统杀掉就自动拉起。
 * AlarmManager 的闹钟在进程死亡后依然会被系统触发，这是四层保活里的第 3 层。
 */
public class WatchdogReceiver extends BroadcastReceiver {

    private static final long INTERVAL = 2 * 60 * 1000L;

    @Override
    public void onReceive(Context context, Intent intent) {
        if (!ServerService.running) {
            try {
                if (Build.VERSION.SDK_INT >= 26) {
                    context.startForegroundService(new Intent(context, ServerService.class));
                } else {
                    context.startService(new Intent(context, ServerService.class));
                }
            } catch (Exception ignored) {
            }
        }
        schedule(context);
    }

    static void schedule(Context context) {
        try {
            AlarmManager am = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
            Intent it = new Intent(context, WatchdogReceiver.class);
            PendingIntent pi = PendingIntent.getBroadcast(context, 0, it,
                    PendingIntent.FLAG_UPDATE_CURRENT);
            am.setRepeating(AlarmManager.ELAPSED_REALTIME_WAKEUP,
                    SystemClock.elapsedRealtime() + INTERVAL, INTERVAL, pi);
        } catch (Exception ignored) {
        }
    }
}
