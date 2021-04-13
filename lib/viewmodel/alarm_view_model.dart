import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/data/model/alarm.dart';
import 'package:light_alarm/data/model/user.dart';
import 'package:light_alarm/data/provider/alarm_repository_provider.dart';
import 'package:light_alarm/data/provider/user_repository_provider.dart';
import 'package:light_alarm/data/repository/alarm_repository.dart';
import 'package:light_alarm/data/repository/user_repository.dart';
import 'package:light_alarm/main.dart';
import 'package:light_alarm/view/dialog/alarm_delete_confirm_dialog.dart';
import 'package:light_alarm/view/dialog/alarm_label_dialog.dart';
import 'package:light_alarm/view/dialog/alarm_repeat_dialog.dart';

final alarmViewModelNotifierProvider =
    ChangeNotifierProvider((ref) => AlarmViewModel(
          ref.read(userRepositoryProvider),
          ref.read(alarmRepositoryProvider),
        ));

class AlarmViewModel extends ChangeNotifier {
  AlarmViewModel(this._userRepository, this._alarmRepository);

  final UserRepository _userRepository;
  final AlarmRepository _alarmRepository;

  DateTime _alarmTime = DateTime.now();
  String label = 'アラーム';
  String repeatDayOfTheWeek = 'なし';

  User? _user;
  User? get user => _user;

  List<Alarm>? _alarms;
  List<Alarm>? get alarms => _alarms;

  Future<void> fetchUser() {
    return _userRepository
        .fetchUser()
        .then((value) => _user = value)
        .whenComplete(notifyListeners);
  }

  Future<void> fetchAlarm() {
    return _alarmRepository
        .fetchAlarms()
        .then((value) => _alarms = value)
        .whenComplete(notifyListeners);
  }

  void scheduleAlarm(
      DateTime scheduledNotificationDateTime, Alarm alarm) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'app_icon',
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('app_icon'),
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

  // TODO(dmb): _alarmTimeを引数に追加すること
  Future<void> saveAlarm(String label, String repeatDayOfTheWeek) async {
    DateTime scheduleAlarmDateTime;
    if (_alarmTime.isAfter(DateTime.now()))
      scheduleAlarmDateTime = _alarmTime;
    else
      scheduleAlarmDateTime = _alarmTime.add(const Duration(days: 1));

    // TODO(dmb): 正しいid,gradientColorIndexをセットすること
    var alarm = Alarm(
      alarmId: -1,
      alarmDateTime: scheduleAlarmDateTime,
      gradientColorIndex: 1,
      title: label,
      repeat: repeatDayOfTheWeek,
      isPending: 0,
    );
    await _alarmRepository.insertAlarm(alarm).whenComplete(notifyListeners);
    scheduleAlarm(scheduleAlarmDateTime, alarm);
    // TODO(dmb): 画面遷移の処理を更新すること
    // Navigator.pop(context);
    fetchAlarm();
  }

  Future<void> updateIsPending(int alarmId, int isPending) async {
    await _alarmRepository
        .updatePending(alarmId, isPending)
        .whenComplete(notifyListeners);
    fetchAlarm();
  }

  Future<void> deleteAlarm(int id) async {
    await _alarmRepository.deleteAlarm(id).whenComplete(notifyListeners);
    fetchAlarm();
  }

  /// Dialog表示(Alarm label)
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

  /// Dialog表示(Alarm Repeat)
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

  /// Dialog表示(Alarm Delete)
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
