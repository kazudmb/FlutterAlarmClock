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
import 'package:light_alarm/view/dialog/alarm_delete_confirm_dialog.dart';
import 'package:light_alarm/view/dialog/alarm_label_dialog.dart';
import 'package:light_alarm/view/dialog/alarm_repeat_dialog.dart';
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

  void scheduleAlarm(DateTime scheduledNotificationDateTime) async {
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

  Future<void> saveTimer(DateTime dateTime) async {
    // TODO(dmb): タイマー用のロジックを実装すること
    DateTime scheduleTimerDateTime;
    if (dateTime.isAfter(DateTime.now()))
      scheduleTimerDateTime = dateTime;
    else
      scheduleTimerDateTime = dateTime.add(const Duration(days: 1));

    var timer = Timer(alarmDateTime: scheduleTimerDateTime);
    await _timerRepository.insertTimer(timer).whenComplete(notifyListeners);
    scheduleAlarm(scheduleTimerDateTime);
    // TODO(dmb): 画面遷移の処理を更新すること
    // Navigator.pop(context);
    fetchTimer();
  }

  Future<void> deleteTimer(int id) async {
    await _timerRepository.deleteTimer(id).whenComplete(notifyListeners);
    fetchTimer();
  }

  /// Dialog表示(Alarm label)
  Future<String?> showAlarmLabelDialog({
    required BuildContext context,
    required String label,
    bool useRootNavigator = true,
  }) {
    final Widget dialog = AlarmLabelDialog(label);
    return showDialog(
      context: context,
      useRootNavigator: useRootNavigator,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  /// Dialog表示(Alarm Repeat)
  Future<List<bool>?> showAlarmRepeatDialog({
    required BuildContext context,
    required List<bool>? repeatDayOfTheWeekCheckbox,
    bool useRootNavigator = true,
  }) {
    final Widget dialog = AlarmRepeatDialog(repeatDayOfTheWeekCheckbox);
    return showDialog(
      context: context,
      useRootNavigator: useRootNavigator,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  /// Dialog表示(Alarm Delete)
  Future<bool?> showAlarmDeleteConfirmDialog({
    required BuildContext context,
    bool useRootNavigator = true,
  }) {
    final Widget dialog = AlarmDeleteConfirmDialog();
    return showDialog(
      context: context,
      useRootNavigator: useRootNavigator,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  /// 繰り返し情報の取得
  String getRepeatDayOfTheWeek(List<bool>? checkboxState) {
    String repeatDayOfTheWeek = '';
    List<String> dayOfTheWeek = ['月 ', '火 ', '水 ', '木 ', '金 ', '土 ', '日 '];
    if (checkboxState != null) {
      for (int i = 0; i < checkboxState.length; i++) {
        if (checkboxState[i]) {
          repeatDayOfTheWeek = repeatDayOfTheWeek + dayOfTheWeek[i];
        }
      }
    }
    if (repeatDayOfTheWeek.isEmpty) {
      repeatDayOfTheWeek = 'なし';
    }
    return repeatDayOfTheWeek;
  }
}
