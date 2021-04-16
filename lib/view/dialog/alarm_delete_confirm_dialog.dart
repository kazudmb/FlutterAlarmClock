import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlarmDeleteConfirmDialog extends StatefulWidget {
  @override
  State createState() => AlarmDeleteConfirmDialogState();
}

class AlarmDeleteConfirmDialogState extends State<AlarmDeleteConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    final CupertinoAlertDialog dialog = CupertinoAlertDialog(
      title: const Text("アラームを削除しますか？"),
      actions: <Widget>[
        CupertinoDialogAction(
          child: const Text("キャンセル"),
          isDestructiveAction: false,
          onPressed: () => Navigator.pop(context, false),
        ),
        CupertinoDialogAction(
          child: const Text("OK"),
          onPressed: () => Navigator.pop(context, true),
        ),
      ],
    );

    return dialog;
  }
}
