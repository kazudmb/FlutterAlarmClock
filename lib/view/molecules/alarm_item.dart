import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:light_alarm/constants/theme_dart.dart';
import 'package:light_alarm/data/model/alarm.dart';

class AlarmItem extends StatefulWidget {
  const AlarmItem(this._alarmInfo);

  final Alarm _alarmInfo;

  @override
  _AlarmItemState createState() => _AlarmItemState();
}

class _AlarmItemState extends State<AlarmItem> {
  @override
  Widget build(BuildContext context) {
    final alarmTime =
        DateFormat('hh:mm aa').format(widget._alarmInfo.alarmDateTime);
    final gradientColor = GradientTemplate
        .gradientTemplate[widget._alarmInfo.gradientColorIndex].colors;

    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            offset: const Offset(4, 4),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    widget._alarmInfo.title,
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'avenir'),
                  ),
                ],
              ),
              Switch(
                onChanged: (bool value) {
                  setState(() {
                    // TODO: ViewModelから取得したデータをセットすること
                    // _switchValue = value;
                    // TODO: スイッチを切り替えたタイミングでDBも更新すること
                    // updateIsPending(widget._alarmInfo.id, _switchValue ? 0 : 1);
                  });
                },
                // value: _switchValue,
                // TODO: スイッチの初期値を設定する方法を検討
                value: widget._alarmInfo.isPending == 0 ? false : true,
                activeColor: Colors.white,
              ),
            ],
          ),
          Text(
            widget._alarmInfo.repeat,
            style: const TextStyle(color: Colors.white, fontFamily: 'avenir'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                alarmTime,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'avenir',
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.white,
                  onPressed: () async {
                    // TODO: dialogの呼び出し
                    // await showAlarmDeleteConfirmDialog(context: context);
                    // TODO: dialogのYes,Noを判定して処理を行う
                    // deleteAlarm(widget._alarmInfo.id);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

//   ).followedBy([
//   if (_currentAlarms.length < 5)
//   DottedBorder(
//   strokeWidth: 2,
//   color: CustomColors.clockOutline,
//   borderType: BorderType.RRect,
//   radius: Radius.circular(24),
//   dashPattern: [5, 4],
//   child: Container(
//   width: double.infinity,
//   decoration: BoxDecoration(
//   color: CustomColors.clockBG,
//   borderRadius:
//   BorderRadius.all(Radius.circular(24)),
//   ),
//   child: FlatButton(
//   padding: const EdgeInsets.symmetric(
//   horizontal: 32, vertical: 16),
//   onPressed: () {
//   _alarmTimeString = DateFormat('HH:mm')
//       .format(DateTime.now());
//   showModalBottomSheet(
//   useRootNavigator: true,
//   context: context,
//   clipBehavior: Clip.antiAlias,
//   shape: RoundedRectangleBorder(
//   borderRadius: BorderRadius.vertical(
//   top: Radius.circular(24),
//   ),
//   ),
//   builder: (context) {
//   return StatefulBuilder(
//   builder: (context, setModalState) {
//   return Container(
//   padding: const EdgeInsets.all(32),
//   child: Column(
//   children: [
//   FlatButton(
//   onPressed: () async {
//   var selectedTime =
//   await showTimePicker(
//   context: context,
//   initialTime:
//   TimeOfDay.now(),
//   );
//   if (selectedTime != null) {
//   final now =
//   DateTime.now();
//   var selectedDateTime =
//   DateTime(
//   now.year,
//   now.month,
//   now.day,
//   selectedTime.hour,
//   selectedTime
//       .minute);
//   _alarmTime =
//   selectedDateTime;
//   setModalState(() {
//   _alarmTimeString =
//   DateFormat('HH:mm')
//       .format(
//   selectedDateTime);
//   });
//   }
//   },
//   child: Text(
//   _alarmTimeString,
//   style:
//   TextStyle(fontSize: 32),
//   ),
//   ),
//   // TODO: 曜日の変更をできるようにすること
//   GestureDetector(
//   onTap: () async {
//   print("onTap called.");
//   List<bool> checkbox =
//   await showAlarmRepeatDialog(
//   context: context);
//   repeatDayOfTheWeek =
//   getRepeatDayOfTheWeek(
//   checkbox);
//   print(checkbox);
//   print(repeatDayOfTheWeek);
//   },
//   child: ListTile(
//   title: Text('繰り返し'),
//   trailing: Text(
//   repeatDayOfTheWeek),
//   ),
//   ),
//   // TODO: タイトルの変更をできるようにすること
//   GestureDetector(
//   onTap: () async {
//   print("onTap called.");
//   label =
//   await showAlarmLabelDialog(
//   context: context);
//   print(label);
//   },
//   child: ListTile(
//   title: Text('ラベル'),
//   trailing: Text(label),
//   ),
//   ),
//   FloatingActionButton.extended(
//   onPressed: () {
//   onSaveAlarm(label,
//   repeatDayOfTheWeek);
//   },
//   icon: Icon(Icons.alarm),
//   label: Text('Save'),
//   ),
//   ],
//   ),
//   );
//   },
//   );
//   },
//   );
//   // scheduleAlarm();
//   },
//   child: Column(
//   children: <Widget>[
//   Image.asset(
//   'assets/add_alarm.png',
//   scale: 1.5,
//   ),
//   SizedBox(height: 8),
//   Text(
//   'Add Alarm',
//   style: TextStyle(
//   color: Colors.white,
//   fontFamily: 'avenir'),
//   ),
//   ],
//   ),
//   ),
//   ),
//   )
//   else
//   Center(
//   child: Text(
//   'Only 5 alarms allowed!',
//   style: TextStyle(color: Colors.white),
//   )),
//   ]).toList(),
//   );
//   }
// }
