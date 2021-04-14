import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlarmLabelDialog extends StatefulWidget {
  AlarmLabelDialog(this._alarmLabel);
  final String _alarmLabel;
  @override
  State createState() => AlarmLabelDialogState(_alarmLabel);
}

class AlarmLabelDialogState extends State<AlarmLabelDialog> {
  AlarmLabelDialogState(this._alarmLabel);
  final String _alarmLabel;
  final dateTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    dateTextController.value = dateTextController.value.copyWith(
      text: _alarmLabel,
    );
    final List<Widget> actions = [
      TextButton(
        child: Text(localizations.cancelButtonLabel),
        onPressed: () => Navigator.pop(context),
      ),
      TextButton(
        child: Text(localizations.okButtonLabel),
        onPressed: () {
          // TODO バリデーション
          String label = dateTextController.text;
          Navigator.pop(context, label);
        },
      ),
    ];
    final AlertDialog dialog = AlertDialog(
      title: const Text("ラベル"),
      content: TextField(
        controller: dateTextController,
        decoration: const InputDecoration(
          hintText: "アラーム",
        ),
        autofocus: true,
        keyboardType: TextInputType.text,
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
