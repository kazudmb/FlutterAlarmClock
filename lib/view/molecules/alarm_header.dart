import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:light_alarm/viewmodel/alarm_view_model.dart';
import 'package:logger/logger.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

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
          },
        ),
      ],
    );
  }

  /// Alarm追加のモーダルシートを表示
  void showModal(BuildContext context) {
    // 現在時刻
    String _alarmTimeString = DateFormat('HH:mm').format(DateTime.now());
    // アラームの設定時間
    TZDateTime? _alarmTime;
    // アラームラベル
    String? label = '';
    // 繰り返しフラグ
    List<bool>? repeatDayOfTheWeekCheckbox = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ];
    // 繰り返し曜日文字
    String repeatDayOfTheWeekString = 'なし';

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
                  TextButton(
                    child: Text(
                      _alarmTimeString,
                      style: const TextStyle(fontSize: 32),
                    ),
                    onPressed: () async {
                      var selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (selectedTime != null) {
                        final now = TZDateTime.now(tz.local);
                        var selectedDateTime = TZDateTime(
                          tz.local,
                          now.year,
                          now.month,
                          now.day,
                          selectedTime.hour,
                          selectedTime.minute,
                        );
                        _alarmTime = selectedDateTime;
                        setModalState(() {
                          _alarmTimeString =
                              DateFormat('HH:mm').format(selectedDateTime);
                        });
                      }
                    },
                  ),
                  GestureDetector(
                    child: ListTile(
                      title: const Text('繰り返し'),
                      trailing: Text(repeatDayOfTheWeekString),
                      onTap: () async {
                        List<bool>? returnValue =
                            await _alarmViewModel.showAlarmRepeatDialog(
                          context: context,
                          repeatDayOfTheWeekCheckbox:
                              repeatDayOfTheWeekCheckbox,
                        );
                        if (returnValue != null) {
                          repeatDayOfTheWeekCheckbox = returnValue;
                        }
                        setModalState(() {
                          repeatDayOfTheWeekString =
                              _alarmViewModel.getRepeatDayOfTheWeek(
                                  repeatDayOfTheWeekCheckbox);
                        });
                      },
                    ),
                  ),
                  GestureDetector(
                    child: ListTile(
                      title: const Text('ラベル'),
                      trailing: Text(label ?? ''),
                      onTap: () async {
                        String? returnValue =
                            await _alarmViewModel.showAlarmLabelDialog(
                          context: context,
                          label: label ?? '',
                        );
                        if (returnValue != null) {
                          label = returnValue;
                        }
                      },
                    ),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      _alarmViewModel.saveAlarm(
                        _alarmTime ?? tz.TZDateTime.now(tz.local),
                        label,
                        repeatDayOfTheWeekString,
                      );
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
