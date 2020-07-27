package com.flutter.example.flutter_app

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.ConnectivityManager
import android.os.Bundle
import android.text.TextUtils
import android.widget.Toast
import com.flutter.example.flutter_app.flutter.NetUtil
import com.flutter.example.flutter_app.flutter.Student
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel





class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.flyou.test/android"
    private val NET_CHANGE_CHANNEL = "com.flyou.test/netChanged"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

//        GeneratedPluginRegistrant.registerWith(this);

//getFlutterEngine().getDartExecutor().getBinaryMessenger()
        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL)
                .setMethodCallHandler { call, p1 ->
                //To change body of created functions use File | Settings | File Templates.
                    if (call.method.equals("showToast")){
                        if (call.hasArgument("msg") && !TextUtils.isEmpty(call.argument("msg"))){
                                Toast.makeText(this@MainActivity, call.argument<String>("msg").toString(), Toast.LENGTH_SHORT).show()
                        }
                    }else if (call.method.equals("netConnection")){
                        val student =Student.Student("1")
                        val networkConnected = NetUtil.isNetworkConnected(applicationContext)
                        p1.success(networkConnected)
                    }
                }
        EventChannel(flutterEngine?.dartExecutor?.binaryMessenger, NET_CHANGE_CHANNEL)
                .setStreamHandler(object : EventChannel.StreamHandler{
                    lateinit var netStateChangeReceiver : BroadcastReceiver
                    override fun onListen(argument: Any?, evens : EventChannel.EventSink?) {
                        netStateChangeReceiver = createNetStateChangeReceiver(evens)
                        registerReceiver(netStateChangeReceiver, IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION))
                    }

                    override fun onCancel(argument: Any?) {
                        unregisterReceiver(netStateChangeReceiver)


                    }
                })
    }

    fun  createNetStateChangeReceiver(events: EventChannel.EventSink? ) : BroadcastReceiver {
            return object : BroadcastReceiver(){
                override fun onReceive(context: Context?, intent: Intent?) {
                    val networkConnected = NetUtil.isNetworkConnected(context)
                    events?.success(if (networkConnected) "网络可用" else "网络不可用")
                }
            }
//        return receiver
    }


}
