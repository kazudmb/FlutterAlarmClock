import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Light Alarm'),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          padding: const EdgeInsets.all(8.0),
          onPressed: () {
            // TODO: モーダルシートを表示すること
            // _alarmTimeString = DateFormat('HH:mm').format(DateTime.now());
            // showModalBottomSheet(
            //   useRootNavigator: true,
            //   context: context,
            //   clipBehavior: Clip.antiAlias,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.vertical(
            //       top: Radius.circular(24),
            //     ),
            //   ),
            //   builder: (context) {
            //     return StatefulBuilder(
            //       builder: (context, setModalState) {
            //         return Container(
            //           padding: const EdgeInsets.all(32),
            //           child: Column(
            //             children: [
            //               FlatButton(
            //                 onPressed: () async {
            //                   var selectedTime =
            //                   await showTimePicker(
            //                     context: context,
            //                     initialTime:
            //                     TimeOfDay.now(),
            //                   );
            //                   if (selectedTime != null) {
            //                     final now = DateTime.now();
            //                     var selectedDateTime =
            //                     DateTime(
            //                         now.year,
            //                         now.month,
            //                         now.day,
            //                         selectedTime.hour,
            //                         selectedTime.minute);
            //                     _alarmTime = selectedDateTime;
            //
            //                     setModalState(() {
            //
            //                       _alarmTimeString =
            //
            //                           DateFormat('HH:mm').format(
            //                               selectedDateTime);
            //                     });
            //                   }
            //                 },
            //                 child: Text(
            //                   _alarmTimeString,
            //                   style:TextStyle(fontSize: 32),
            //                 ),
            //               ),
            //               // TODO: 曜日の変更をできるようにすること
            //               GestureDetector(
            //                 onTap: () async {
            //                   print("onTap called.");
            //                   List<bool> checkbox = await showAlarmRepeatDialog(
            //                       context: context);
            //                   repeatDayOfTheWeek =
            //                       getRepeatDayOfTheWeek(checkbox);
            //                   print(checkbox);
            //                   print(repeatDayOfTheWeek);
            //                 },
            //                 child: ListTile(
            //                   title: Text('繰り返し'),
            //                   trailing: Text(repeatDayOfTheWeek),
            //                 ),
            //               ),
            //               // TODO: タイトルの変更をできるようにすること
            //               GestureDetector(
            //                 onTap: () async {
            //                   print("onTap called.");
            //                   label = await showAlarmLabelDialog(context: context);
            //                   print(label);
            //                 },
            //                 child: ListTile(
            //                   title: Text('ラベル'),
            //                   trailing: Text(label),
            //                 ),
            //               ),
            //               FloatingActionButton.extended(
            //                 onPressed: () {
            //                   onSaveAlarm(label,repeatDayOfTheWeek);
            //                 },
            //                 icon: Icon(Icons.alarm),
            //                 label: Text('Save'),
            //               ),
            //             ],
            //           ),
            //         );
            //       },
            //     );
            //   },
            // );
            // scheduleAlarm();
          },
        ),
      ],
      centerTitle: true,
      elevation: 0.0,
    );
  }
}
