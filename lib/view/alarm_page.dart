import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:light_alarm/constants/theme_dart.dart';
import 'package:light_alarm/main.dart';
import 'package:light_alarm/model/Alarm.dart';
import 'package:light_alarm/view/dialog/alarm_delete_confirm_dialog.dart';
import 'package:light_alarm/view/dialog/alarm_label_dialog.dart';
import 'package:light_alarm/view/dialog/alarm_repeat_dialog.dart';
import 'package:light_alarm/viewmodel/alarm_helper.dart';

final counterProvider = StateProvider((ref) => 0);

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  DateTime _alarmTime;
  String _alarmTimeString;
  AlarmHelper _alarmHelper = AlarmHelper();
  Future<List<Alarm>> _alarms;
  List<Alarm> _currentAlarms;
  String label = 'アラーム';
  String repeatDayOfTheWeek = 'なし';
  bool _switchValue = false;

  @override
  void initState() {
    _alarmTime = DateTime.now();
    _alarmHelper.initializeDatabase().then((value) {
      print('------database intialized');
      loadAlarms();
    });
    super.initState();
  }

  void loadAlarms() {
    _alarms = _alarmHelper.getAlarms();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.pageBackgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Alarm',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w700,
                  color: CustomColors.primaryTextColor,
                  fontSize: 24),
            ),
            Expanded(
              child: FutureBuilder<List<Alarm>>(
                future: _alarms,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    _currentAlarms = snapshot.data;
                    return ListView(
                      children: snapshot.data.map<Widget>((alarm) {
                        var alarmTime =
                            DateFormat('hh:mm aa').format(alarm.alarmDateTime);
                        var gradientColor = GradientTemplate
                            .gradientTemplate[alarm.gradientColorIndex].colors;
                        return Container(
                          margin: const EdgeInsets.only(bottom: 32),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColor,
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: gradientColor.last.withOpacity(0.4),
                                blurRadius: 8,
                                spreadRadius: 2,
                                offset: Offset(4, 4),
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        alarm.title,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'avenir'),
                                      ),
                                    ],
                                  ),
                                  Switch(
                                    onChanged: (bool value) {
                                      setState(() {
                                        _switchValue = value;
                                        updateIsPending(
                                            alarm.id, _switchValue ? 0 : 1);
                                      });
                                    },
                                    value: _switchValue,
                                    // TODO: スイッチの初期値を設定する方法を検討
                                    // value: alarm.isPending == 0 ? false : true,
                                    activeColor: Colors.white,
                                  ),
                                ],
                              ),
                              Text(
                                alarm.repeat,
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'avenir'),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    alarmTime,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'avenir',
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  IconButton(
                                      icon: Icon(Icons.delete),
                                      color: Colors.white,
                                      onPressed: () async {
                                        await showAlarmDeleteConfirmDialog(
                                            context: context);
                                        // TODO: dialogのYes,Noを判定して処理を行う
                                        deleteAlarm(alarm.id);
                                      }),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).followedBy([
                        if (_currentAlarms.length < 5)
                          DottedBorder(
                            strokeWidth: 2,
                            color: CustomColors.clockOutline,
                            borderType: BorderType.RRect,
                            radius: Radius.circular(24),
                            dashPattern: [5, 4],
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: CustomColors.clockBG,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                              ),
                              child: FlatButton(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 16),
                                onPressed: () {
                                  _alarmTimeString = DateFormat('HH:mm')
                                      .format(DateTime.now());
                                  showModalBottomSheet(
                                    useRootNavigator: true,
                                    context: context,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(24),
                                      ),
                                    ),
                                    builder: (context) {
                                      return StatefulBuilder(
                                        builder: (context, setModalState) {
                                          return Container(
                                            padding: const EdgeInsets.all(32),
                                            child: Column(
                                              children: [
                                                FlatButton(
                                                  onPressed: () async {
                                                    var selectedTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime:
                                                          TimeOfDay.now(),
                                                    );
                                                    if (selectedTime != null) {
                                                      final now =
                                                          DateTime.now();
                                                      var selectedDateTime =
                                                          DateTime(
                                                              now.year,
                                                              now.month,
                                                              now.day,
                                                              selectedTime.hour,
                                                              selectedTime
                                                                  .minute);
                                                      _alarmTime =
                                                          selectedDateTime;
                                                      setModalState(() {
                                                        _alarmTimeString =
                                                            DateFormat('HH:mm')
                                                                .format(
                                                                    selectedDateTime);
                                                      });
                                                    }
                                                  },
                                                  child: Text(
                                                    _alarmTimeString,
                                                    style:
                                                        TextStyle(fontSize: 32),
                                                  ),
                                                ),
                                                // TODO: 曜日の変更をできるようにすること
                                                GestureDetector(
                                                  onTap: () async {
                                                    print("onTap called.");
                                                    List<bool> checkbox =
                                                        await showAlarmRepeatDialog(
                                                            context: context);
                                                    repeatDayOfTheWeek =
                                                        getRepeatDayOfTheWeek(
                                                            checkbox);
                                                    print(checkbox);
                                                    print(repeatDayOfTheWeek);
                                                  },
                                                  child: ListTile(
                                                    title: Text('繰り返し'),
                                                    trailing: Text(
                                                        repeatDayOfTheWeek),
                                                  ),
                                                ),
                                                // TODO: タイトルの変更をできるようにすること
                                                GestureDetector(
                                                  onTap: () async {
                                                    print("onTap called.");
                                                    label =
                                                        await showAlarmLabelDialog(
                                                            context: context);
                                                    print(label);
                                                  },
                                                  child: ListTile(
                                                    title: Text('ラベル'),
                                                    trailing: Text(label),
                                                  ),
                                                ),
                                                FloatingActionButton.extended(
                                                  onPressed: () {
                                                    onSaveAlarm(label,
                                                        repeatDayOfTheWeek);
                                                  },
                                                  icon: Icon(Icons.alarm),
                                                  label: Text('Save'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                  // scheduleAlarm();
                                },
                                child: Column(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/add_alarm.png',
                                      scale: 1.5,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Add Alarm',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'avenir'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        else
                          Center(
                              child: Text(
                            'Only 5 alarms allowed!',
                            style: TextStyle(color: Colors.white),
                          )),
                      ]).toList(),
                    );
                  }
                  return Center(
                    child: Text(
                      'Loading..',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
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

    var alarmInfo = Alarm(
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
