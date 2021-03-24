import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/main.dart';
import 'package:light_alarm/model/alarm.dart';
import 'package:light_alarm/model/repository/alarm_repository.dart';
import 'package:light_alarm/model/repository/alarm_repository_provider.dart';
import 'package:light_alarm/model/user.dart';
import 'package:light_alarm/view/dialog/alarm_delete_confirm_dialog.dart';
import 'package:light_alarm/view/dialog/alarm_label_dialog.dart';
import 'package:light_alarm/view/dialog/alarm_repeat_dialog.dart';
import 'package:light_alarm/viewmodel/alarm_helper.dart';

final alarmViewModelNotifierProvider = ChangeNotifierProvider(
    (ref) => AlarmViewModel(repository: ref.read(alarmRepositoryProvider)));

class AlarmViewModel extends ChangeNotifier {
  AlarmViewModel({required AlarmRepository repository})
      : _repository = repository;

  DateTime _alarmTime;
  String _alarmTimeString;
  AlarmHelper _alarmHelper = AlarmHelper();
  Future<List<User>> _alarms;
  List<User> _currentAlarms;
  String label = 'アラーム';
  String repeatDayOfTheWeek = 'なし';
  bool _switchValue = false;

  final AlarmRepository _repository;

  User _alarm;

  User get alarm => _alarm;

  void init() {
    _alarmTime = DateTime.now();
    _alarmHelper.initializeDatabase().then((value) {
      print('------database intialized');
      loadAlarms();
    });
  }

  void loadAlarms() {
    _alarms = _alarmHelper.getUser();
  }

  Future<void> fetchAlarm() async {
    return _repository
        .getAlarm()
        .then((value) {
          _alarm = value as User;
        })
        .catchError((dynamic error) {})
        .whenComplete(() => notifyListeners());
  }

  void scheduleAlarm(
      DateTime scheduledNotificationDateTime, Alarm alarm) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'codex_logo',
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('codex_logo'),
    );

    var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
        sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    // TODO(dmb): 通知内容の修正
    await flutterLocalNotificationsPlugin.schedule(0, 'Office', '通知タイトル',
        scheduledNotificationDateTime, platformChannelSpecifics);
  }

  void onSaveAlarm(String label, String repeatDayOfTheWeek) {
    DateTime scheduleAlarmDateTime;
    if (_alarmTime.isAfter(DateTime.now()))
      scheduleAlarmDateTime = _alarmTime;
    else
      scheduleAlarmDateTime = _alarmTime.add(const Duration(days: 1));

    // TODO(dmb): 正しいidをセットすること
    var alarm = Alarm(
      id: -1,
      alarmDateTime: scheduleAlarmDateTime,
      gradientColorIndex: _currentAlarms.length,
      title: label,
      repeat: repeatDayOfTheWeek,
      isPending: 0,
    );
    _alarmHelper.insertAlarm(alarm);
    scheduleAlarm(scheduleAlarmDateTime, alarm);
    Navigator.pop(context);
    loadAlarms();
  }

  void updateIsPending(int id, int isPending) {
    _alarmHelper.updatePending(id, isPending);
    loadAlarms();
  }

  void deleteAlarm(int id) {
    _alarmHelper.delete(id);
    //unsubscribe for notification
    loadAlarms();
  }

  Future<String?> showAlarmLabelDialog({
    required BuildContext context,
    bool useRootNavigator = true,
  }) {
    final Widget dialog = AlarmLabelDialog();
    return showDialog(
      context: context,
      useRootNavigator: useRootNavigator,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  Future<List<bool>?> showAlarmRepeatDialog({
    required BuildContext context,
    bool useRootNavigator = true,
  }) {
    final Widget dialog = AlarmRepeatDialog();
    return showDialog(
      context: context,
      useRootNavigator: useRootNavigator,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  Future<String?> showAlarmDeleteConfirmDialog({
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

  String getRepeatDayOfTheWeek(List<bool> checkboxState) {
    String repeatDayOfTheWeek = '';
    List<String> dayOfTheWeek = ['月 ', '火 ', '水 ', '木 ', '金 ', '土 ', '日 '];
    for (int i = 0; i < checkboxState.length; i++) {
      if (checkboxState[i]) {
        repeatDayOfTheWeek = repeatDayOfTheWeek + dayOfTheWeek[i];
      }
    }
    if (repeatDayOfTheWeek.isEmpty) {
      repeatDayOfTheWeek = 'なし';
    }
    return repeatDayOfTheWeek;
  }
}
