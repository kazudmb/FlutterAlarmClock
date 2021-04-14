import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlarmRepeatDialog extends StatefulWidget {
  AlarmRepeatDialog(this._repeatDayOfTheWeekCheckbox);
  final List<bool>? _repeatDayOfTheWeekCheckbox;
  @override
  State createState() => AlarmRepeatDialogState(_repeatDayOfTheWeekCheckbox);
}

class AlarmRepeatDialogState extends State<AlarmRepeatDialog> {
  AlarmRepeatDialogState(this._repeatDayOfTheWeekCheckbox);
  final List<bool>? _repeatDayOfTheWeekCheckbox;
  final dateTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final List<Widget> actions = [
      TextButton(
        child: Text(localizations.cancelButtonLabel),
        onPressed: () => Navigator.pop(context),
      ),
      TextButton(
        child: Text(localizations.okButtonLabel),
        onPressed: () {
          Navigator.pop(context, _repeatDayOfTheWeekCheckbox);
        },
      ),
    ];
    final AlertDialog dialog = AlertDialog(
      title: const Text("繰り返し"),
      content: Container(
        width: double.maxFinite,
        child: Column(
          children: [
            // TODO(dmb): ループで回すように修正したい
            CheckboxListTile(
              value: _repeatDayOfTheWeekCheckbox?[0],
              title: const Text('月曜日'),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (bool? value) {
                setState(() {
                  _repeatDayOfTheWeekCheckbox?[0] = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: _repeatDayOfTheWeekCheckbox?[1],
              title: const Text('火曜日'),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (bool? value) {
                setState(() {
                  _repeatDayOfTheWeekCheckbox?[1] = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: _repeatDayOfTheWeekCheckbox?[2],
              title: const Text('水曜日'),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (bool? value) {
                setState(() {
                  _repeatDayOfTheWeekCheckbox?[2] = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: _repeatDayOfTheWeekCheckbox?[3],
              title: const Text('木曜日'),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (bool? value) {
                setState(() {
                  _repeatDayOfTheWeekCheckbox?[3] = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: _repeatDayOfTheWeekCheckbox?[4],
              title: const Text('金曜日'),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (bool? value) {
                setState(() {
                  _repeatDayOfTheWeekCheckbox?[4] = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: _repeatDayOfTheWeekCheckbox?[5],
              title: const Text('土曜日'),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (bool? value) {
                setState(() {
                  _repeatDayOfTheWeekCheckbox?[5] = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: _repeatDayOfTheWeekCheckbox?[6],
              title: const Text('日曜日'),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (bool? value) {
                setState(() {
                  _repeatDayOfTheWeekCheckbox?[6] = value ?? false;
                });
              },
            ),
          ],
        ),
      ),
      actions: actions,
    );

    return dialog;
  }

  @override
  void dispose() {
    dateTextController.dispose();
    super.dispose();
  }
}
