import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/main.dart';
import 'package:light_alarm/model/alarm.dart';
import 'package:light_alarm/model/alarm_info.dart';
import 'package:light_alarm/model/repository/alarm_repository.dart';
import 'package:light_alarm/model/repository/alarm_repository_provider.dart';
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
  Future<List<Alarm>> _alarms;
  List<Alarm> _currentAlarms;
  String label = 'アラーム';
  String repeatDayOfTheWeek = 'なし';
  bool _switchValue = false;

  final AlarmRepository _repository;

  Alarm _alarm;

  Alarm get alarm => _alarm;

  void init() {
    _alarmTime = DateTime.now();
    _alarmHelper.initializeDatabase().then((value) {
      print('------database intialized');
      loadAlarms();
    });
  }

  void loadAlarms() {
    _alarms = _alarmHelper.getAlarms();
  }

  Future<void> fetchAlarm() async {
    return _repository
        .getAlarm()
        .then((value) {
          _alarm = value as Alarm;
        })
        .catchError((dynamic error) {})
        .whenComplete(() => notifyListeners());
  }

  void scheduleAlarm(
      DateTime scheduledNotificationDateTime, Alarm alarmInfo) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'codex_logo',
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('codex_logo'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(0, 'Office', alarmInfo.title,
        scheduledNotificationDateTime, platformChannelSpecifics);
  }

  void onSaveAlarm(String label, String repeatDayOfTheWeek) {
    DateTime scheduleAlarmDateTime;
    if (_alarmTime.isAfter(DateTime.now()))
      scheduleAlarmDateTime = _alarmTime;
    else
      scheduleAlarmDateTime = _alarmTime.add(Duration(days: 1));

    var alarmInfo = AlarmInfo(
      alarmDateTime: scheduleAlarmDateTime,
      gradientColorIndex: _currentAlarms.length,
      title: label,
      repeat: repeatDayOfTheWeek,
      isPending: 0,
    );
    _alarmHelper.insertAlarm(alarmInfo);
    scheduleAlarm(scheduleAlarmDateTime, alarmInfo);
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

  Future<String> showAlarmLabelDialog({
    @required BuildContext context,
    TransitionBuilder builder,
    bool useRootNavigator = true,
  }) {
    final Widget dialog = AlarmLabelDialog();
    return showDialog(
      context: context,
      useRootNavigator: useRootNavigator,
      builder: (BuildContext context) {
        return builder == null ? dialog : builder(context, dialog);
      },
    );
  }

  Future<List<bool>> showAlarmRepeatDialog({
    @required BuildContext context,
    TransitionBuilder builder,
    bool useRootNavigator = true,
  }) {
    final Widget dialog = AlarmRepeatDialog();
    return showDialog(
      context: context,
      useRootNavigator: useRootNavigator,
      builder: (BuildContext context) {
        return builder == null ? dialog : builder(context, dialog);
      },
    );
  }

  Future<String> showAlarmDeleteConfirmDialog({
    @required BuildContext context,
    TransitionBuilder builder,
    bool useRootNavigator = true,
  }) {
    final Widget dialog = AlarmDeleteConfirmDialog();
    return showDialog(
      context: context,
      useRootNavigator: useRootNavigator,
      builder: (BuildContext context) {
        return builder == null ? dialog : builder(context, dialog);
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
