import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlarmRepeatDialog extends StatefulWidget {
  @override
  State createState() => AlarmRepeatDialogState();
}

class AlarmRepeatDialogState extends State<AlarmRepeatDialog> {
  final dateTextController = TextEditingController();
  List<bool> _checkBox = [false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final List<Widget> actions = [
      FlatButton(
        child: Text(localizations.cancelButtonLabel),
        onPressed: () => Navigator.pop(context),
      ),
      FlatButton(
        child: Text(localizations.okButtonLabel),
        onPressed: () {
          Navigator.pop(context, _checkBox);
        },
      ),
    ];
    final AlertDialog dialog = AlertDialog(
      title: const Text("繰り返し"),
      content: Container(
        width: double.maxFinite,
        child: Column(
          children: [
            CheckboxListTile(
              value: _checkBox[0],
              title: const Text('月曜日'),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (bool? value) {
                setState(() {
                  _checkBox[0] = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: _checkBox[1],
              title: const Text('火曜日'),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (bool? value) {
                setState(() {
                  _checkBox[1] = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: _checkBox[2],
              title: const Text('水曜日'),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (bool? value) {
                setState(() {
                  _checkBox[2] = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: _checkBox[3],
              title: const Text('木曜日'),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (bool? value) {
                setState(() {
                  _checkBox[3] = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: _checkBox[4],
              title: const Text('金曜日'),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (bool? value) {
                setState(() {
                  _checkBox[4] = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: _checkBox[5],
              title: const Text('土曜日'),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (bool? value) {
                setState(() {
                  _checkBox[5] = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: _checkBox[6],
              title: const Text('日曜日'),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (bool? value) {
                setState(() {
                  _checkBox[6] = value ?? false;
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
