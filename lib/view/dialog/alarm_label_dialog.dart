import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlarmLabelDialog extends StatefulWidget {
  @override
  State createState() => AlarmLabelDialogState();
}

class AlarmLabelDialogState extends State<AlarmLabelDialog> {
  final dateTextController = TextEditingController();

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
          // TODO バリデーション
          String label = dateTextController.text;
          Navigator.pop(context, label);
        },
      ),
    ];
    final AlertDialog dialog = AlertDialog(
      title: Text("ラベル"),
      content: TextField(
        controller: dateTextController,
        decoration: InputDecoration(
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
