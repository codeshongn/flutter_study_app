package com.example.flutter_application

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.os.Build
import android.util.Base64
import androidx.annotation.NonNull
import android.app.AlertDialog

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.flutter.dev/info"
    private val CHANNEL2 = "com.flutter.dev/encrypto"
    private val CHANNEL3 = "com.flutter.dev/dialog"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
                .setMethodCallHandler { call, result ->
                    if (call.method == "getDeviceInfo") {
                        val deviceInfo = getDeviceInfo()
                        result.success(deviceInfo)
                    }
                }
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL2)
                .setMethodCallHandler { call, result ->
                    if (call.method == "getEncrypto") {
                        val data = call.arguments.toString().toByteArray()
                        val changeText = Base64.encodeToString(data, Base64.DEFAULT)
                        result.success(changeText)
                    } else if (call.method == "getDecrypto") {
                        val data = call.arguments.toString()
                        val changeText = Base64.decode(data, Base64.DEFAULT)
                        result.success(String(changeText))
                    }
                }
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL3)
            .setMethodCallHandler { call, result ->
                if (call.method == "showDialog") {
                    AlertDialog.Builder(this)
                        .setTitle("Flutter")
                        .setMessage("Native popup")
                        .show()
                }
            }
    }
}

private fun getDeviceInfo(): String {
    val sb = StringBuffer()
    sb.append(Build.DEVICE + "\n")
    sb.append(Build.BRAND + "\n")
    sb.append(Build.MODEL + "\n")
    return sb.toString()
}

