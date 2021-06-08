import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/view/molecules/admob.dart';
import 'package:light_alarm/view/pages/timer_page.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // タイムゾーンの初期設定
  await _configureLocalTimeZone();

  // notificationの初期設定
  var initializationSettingsAndroid =
      const AndroidInitializationSettings('doroid');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {});
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: _selectNotification);

  // AdMobの初期化処理
  MobileAds.instance.initialize();

  runApp(ProviderScope(child: MyApp()));
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
      home: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          TimerPage(),
          AdMobPage(),
        ],
      ),
    );
  }
}

Future<void> _configureLocalTimeZone() async {
  tz.initializeTimeZones();
  // TODO(dmb): MethodChannelを使用して、端末のLocation情報を取得したい
  // final String? timeZoneName =
  //     await platform.invokeMethod<String>('getTimeZoneName');
  var japan = getLocation('Asia/Tokyo');
  setLocalLocation(japan);
}

Future<void> _selectNotification(String? payload) async {
  if (payload != null) {
    switch (payload) {
      // TODO(dmb): アプリ起動時に、最初に開くタブ(画面)を判定すること
      // TODO(dmb): LED消灯、バイブ停止もここで行う？？
      case 'alarm':
      case 'timer':
    }
  }
}
