package com.lath.carnotifyserver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;

/** 开机自启：重启后自动把服务拉起来 */
public class BootReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        try {
            if (Build.VERSION.SDK_INT >= 26) {
                context.startForegroundService(new Intent(context, ServerService.class));
            } else {
                context.startService(new Intent(context, ServerService.class));
            }
        } catch (Exception ignored) {
        }
    }
}
