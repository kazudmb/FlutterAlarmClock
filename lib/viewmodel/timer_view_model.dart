import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/data/model/timer.dart';
import 'package:light_alarm/data/model/user.dart';
import 'package:light_alarm/data/provider/timer_repository_provider.dart';
import 'package:light_alarm/data/provider/user_repository_provider.dart';
import 'package:light_alarm/data/repository/timer_repository.dart';
import 'package:light_alarm/data/repository/user_repository.dart';
import 'package:light_alarm/main.dart';
import 'package:timezone/timezone.dart' as tz;

final timerViewModelNotifierProvider =
    ChangeNotifierProvider((ref) => TimerViewModel(
          ref.read(userRepositoryProvider),
          ref.read(timerRepositoryProvider),
        ));

class TimerViewModel extends ChangeNotifier {
  TimerViewModel(this._userRepository, this._timerRepository);

  final UserRepository _userRepository;
  final TimerRepository _timerRepository;

  String label = 'アラーム';
  String repeatDayOfTheWeek = 'なし';

  User? _user;
  User? get user => _user;

  Timer? _timer;
  Timer? get timer => _timer;

  Duration countDownTime = const Duration(seconds: 0);
  DateTime countDownDateTime = DateTime.utc(0, 0, 0);

  Future<void> fetchUser() {
    return _userRepository
        .fetchUser()
        .then((value) => _user = value)
        .whenComplete(notifyListeners);
  }

  Future<void> fetchTimer() {
    return _timerRepository
        .fetchTimer()
        .then((value) => _timer = value)
        .whenComplete(notifyListeners);
  }

  void scheduleTimer(DateTime scheduledNotificationDateTime) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'scheduled title',
        'scheduled body',
        tz.TZDateTime(
          tz.local,
          scheduledNotificationDateTime.year,
          scheduledNotificationDateTime.month,
          scheduledNotificationDateTime.day,
          scheduledNotificationDateTime.hour,
          scheduledNotificationDateTime.minute,
          scheduledNotificationDateTime.second,
        ),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'full screen channel id',
            'full screen channel name',
            'full screen channel description',
            icon: 'doroid',
            largeIcon: DrawableResourceAndroidBitmap('doroid'),
            priority: Priority.high,
            importance: Importance.high,
            fullScreenIntent: true,
          ),
          iOS: IOSNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: false,
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> cancelTimer() async {
    // TODO(dmb): キャンセルの動作確認すること
    // TODO(dmb): Timerのidは、1を固定値として持つこと
    await flutterLocalNotificationsPlugin.cancel(1);
  }

  Future<void> saveTimer(DateTime dateTime) async {
    // TODO(dmb): タイマー用のロジックを実装すること
    DateTime scheduleTimerDateTime;
    if (dateTime.isAfter(DateTime.now()))
      scheduleTimerDateTime = dateTime;
    else
      scheduleTimerDateTime = dateTime.add(const Duration(days: 1));

    var timer = Timer(timerDateTime: scheduleTimerDateTime);
    await _timerRepository.insertTimer(timer).whenComplete(notifyListeners);
    scheduleTimer(scheduleTimerDateTime);
    fetchTimer();
  }

  Future<void> deleteTimer() async {
    await _timerRepository.deleteTimer().whenComplete(notifyListeners);
    fetchTimer();
  }

  Future<void> setCountDownDateTime(Duration countDownTime) async {
    DateTime currentTime = DateTime.now();
    int hours = 0;
    int minutes = 0;
    int seconds = 0;

    hours = countDownTime.inHours;
    if (countDownTime.inMinutes <= 60) {
      minutes = 0;
    } else {
      minutes = countDownTime.inMinutes;
    }
    if (countDownTime.inSeconds <= 60) {
      seconds = 0;
    } else {
      seconds = countDownTime.inSeconds;
    }

    // TODO(dmb): タイムゾーンの影響？で時間のみがズレる
    countDownDateTime = DateTime(
      currentTime.year,
      currentTime.month,
      currentTime.day,
      hours,
      minutes,
      seconds,
    );
  }
}
