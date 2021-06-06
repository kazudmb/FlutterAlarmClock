package com.dmb.light_alarm

import android.content.Context
import android.hardware.camera2.CameraManager
import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    companion object {
        private const val CHANNEL_NAME = "com.dmb/light_alarm"
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME).setMethodCallHandler { methodCall, result ->
            when (methodCall.method) {
                "setTorchMode" -> (methodCall.arguments as HashMap<String, *>)["enabled"]?.let {
                    setTorchMode(it as Boolean, result)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun setTorchMode(enabled: Boolean, result: MethodChannel.Result) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            val cameraManager = getSystemService(Context.CAMERA_SERVICE) as CameraManager
            val cameraId = cameraManager.cameraIdList[0]
            cameraManager.setTorchMode(cameraId, enabled)
            result.success(enabled)
        } else {
            result.error("UNAVAILABLE", "Flash not available", null)
        }
    }
}
