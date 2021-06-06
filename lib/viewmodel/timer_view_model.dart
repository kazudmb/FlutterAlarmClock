import 'dart:async' as async;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/constants/constant.dart';
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

  User? _user;
  User? get user => _user;

  Timer? _timer;
  Timer? get timer => _timer;

  Duration countDownTime = const Duration(seconds: 0);
  DateTime countDownDateTime = DateTime.utc(0, 0, 0);
  bool isPauseTimer = false;

  static const methodChannel = MethodChannel('com.dmb/light_alarm');
  bool _isFlashLightOn = false;

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

  Future<void> saveTimer(DateTime scheduleTimerDateTime) async {
    var timer = Timer(timerDateTime: scheduleTimerDateTime);
    await _timerRepository.insertTimer(timer).whenComplete(notifyListeners);
    scheduleTimer(scheduleTimerDateTime);
  }

  Future<void> deleteTimer() async {
    cancelScheduleTimer();
    await _timerRepository.deleteTimer().whenComplete(notifyListeners);
  }

  void scheduleTimer(DateTime scheduledNotificationDateTime) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        Constant.notificationTimerId,
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
          scheduledNotificationDateTime.millisecond,
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

  Future<void> cancelScheduleTimer() async {
    await flutterLocalNotificationsPlugin.cancel(Constant.notificationTimerId);
  }

  Future<void> startCountDown(
    DateTime currentTime, {
    DateTime? notificationTime,
  }) async {
    this.isPauseTimer = false;
    if (notificationTime == null) {
      notificationTime = currentTime.add(countDownTime);
    }

    countDownDateTime = DateTime(
      notificationTime.year,
      notificationTime.month,
      notificationTime.day,
      notificationTime.hour - currentTime.hour,
      notificationTime.minute - currentTime.minute,
      notificationTime.second - currentTime.second,
      notificationTime.millisecond - currentTime.millisecond,
    );

    if (!(countDownDateTime.hour == 0 &&
        countDownDateTime.minute == 0 &&
        countDownDateTime.second == 0 &&
        countDownDateTime.millisecond == 0)) {
      saveTimer(notificationTime);
      fetchTimer();
      async.Timer.periodic(
        const Duration(seconds: 1),
        _decrementDownDateTime,
      );
    }
  }

  void _decrementDownDateTime(async.Timer timer) {
    countDownDateTime = countDownDateTime.subtract(const Duration(seconds: 1));
    if (countDownDateTime.hour == 0 &&
        countDownDateTime.minute == 0 &&
        countDownDateTime.second == 0 &&
        countDownDateTime.millisecond == 0) {
      _setTorchMode();
      timer.cancel();
      deleteTimer();
      fetchTimer();
    } else {
      notifyListeners();
    }

    if (this.isPauseTimer) {
      countDownTime = Duration(
          milliseconds: countDownDateTime.millisecond,
          seconds: countDownDateTime.second,
          minutes: countDownDateTime.minute,
          hours: countDownDateTime.hour);
      timer.cancel();
      deleteTimer();
    }
  }

  void updatePauseStatus(bool isPauseTimer) {
    this.isPauseTimer = isPauseTimer;
    if (!this.isPauseTimer) {
      startCountDown(DateTime.now());
    }
    notifyListeners();
  }

  void _setTorchMode() async {
    await methodChannel.invokeMethod<bool>(
      "setTorchMode",
      {"enabled": !_isFlashLightOn},
    );
  }
}
