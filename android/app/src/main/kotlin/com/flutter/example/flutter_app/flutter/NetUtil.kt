package com.flutter.example.flutter_app.flutter

import android.content.Context
import android.net.ConnectivityManager
import android.net.NetworkInfo

class NetUtil {

    companion object StaticParams{
        fun isNetworkConnected(context : Context?) :Boolean{
            val connManager = context?.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
            val info = connManager.activeNetworkInfo
            return info?.state == NetworkInfo.State.CONNECTED
        }
    }
}