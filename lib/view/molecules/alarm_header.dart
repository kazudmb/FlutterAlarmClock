import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:light_alarm/viewmodel/alarm_view_model.dart';
import 'package:logger/logger.dart';

// TODO(dmb): ViewModelを渡して、ViewModel側でメソッドを実行すること
class AlarmHeader extends StatelessWidget with PreferredSizeWidget {
  AlarmHeader(this._alarmViewModel);

  final AlarmViewModel _alarmViewModel;
  final logger = Logger();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Light Alarm'),
      centerTitle: true,
      elevation: 0.0,
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          padding: const EdgeInsets.all(8.0),
          onPressed: () {
            showModal(context);
            // TODO(dmb) 下記のメソッドも実行すること
            // scheduleAlarm();
          },
        ),
      ],
    );
  }

  /// Alarm追加のモーダルシートを表示
  void showModal(BuildContext context) {
    String _alarmTimeString = DateFormat('HH:mm').format(DateTime.now());
    String? label = '';
    String repeatDayOfTheWeek = '';

    // ModalBottomSheetの表示
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
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
                      var selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (selectedTime != null) {
                        final now = DateTime.now();
                        var selectedDateTime = DateTime(
                          now.year,
                          now.month,
                          now.day,
                          selectedTime.hour,
                          selectedTime.minute,
                        );
                        // _alarmTime = selectedDateTime;
                        setModalState(() {
                          _alarmTimeString =
                              DateFormat('HH:mm').format(selectedDateTime);
                        });
                      }
                    },
                    child: Text(
                      _alarmTimeString,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                  // TODO: 曜日の変更をできるようにすること
                  GestureDetector(
                    onTap: () async {
                      List<bool>? checkbox = await _alarmViewModel
                          .showAlarmRepeatDialog(context: context);
                      repeatDayOfTheWeek =
                          _alarmViewModel.getRepeatDayOfTheWeek(checkbox);
                      logger.d(repeatDayOfTheWeek);
                    },
                    child: ListTile(
                      title: const Text('繰り返し'),
                      trailing: Text(repeatDayOfTheWeek),
                    ),
                  ),
                  // TODO: タイトルの変更をできるようにすること
                  GestureDetector(
                    onTap: () async {
                      label = await _alarmViewModel.showAlarmLabelDialog(
                          context: context);
                      logger.d(label);
                    },
                    child: ListTile(
                      title: const Text('ラベル'),
                      trailing: Text(label ?? ''),
                    ),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      // _alarmViewModel.saveAlarm(label, repeatDayOfTheWeek);
                    },
                    icon: const Icon(Icons.alarm),
                    label: const Text('Save'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
