import 'package:light_alarm/model/Alarm.dart';

List<Alarm> alarms = [
  Alarm(
      alarmDateTime: DateTime.now().add(Duration(hours: 1)),
      title: 'Office',
      gradientColorIndex: 0),
  Alarm(
      alarmDateTime: DateTime.now().add(Duration(hours: 2)),
      title: 'Sport',
      gradientColorIndex: 1),
];
