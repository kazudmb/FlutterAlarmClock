import 'package:flutter/services.dart';

class MethodChannelUtil {
  static const methodChannel = MethodChannel('com.dmb/light_alarm');

  /// スマホLEDの点灯,消灯
  void setTorchMode(bool isFlashLightOn) async {
    await methodChannel.invokeMethod<bool>(
      "setTorchMode",
      {"enabled": !isFlashLightOn},
    );
  }
}
