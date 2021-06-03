import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/view/pages/timer_page.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// TODO(dmb): method channelの調査
// const MethodChannel platform =
//     MethodChannel('dexterx.dev/flutter_local_notifications_example');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _configureLocalTimeZone();

  var initializationSettingsAndroid =
      const AndroidInitializationSettings('doroid');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {});
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {
    debugPrint('notification payload: ' + payload!);
  });

  // AdMobの初期化処理
  MobileAds.instance.initialize();

  runApp(ProviderScope(child: MyApp()));
}

Future<void> _configureLocalTimeZone() async {
  tz.initializeTimeZones();
  // TODO(dmb): MethodChannelを使用して、端末のLocation情報を取得したい
  // final String? timeZoneName =
  //     await platform.invokeMethod<String>('getTimeZoneName');
  var japan = getLocation('Asia/Tokyo');
  setLocalLocation(japan);
}

class MyApp extends HookWidget {
  // This view.widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TimerPage(),
    );
  }
}
