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
      title: const Text("削除しますか？"),
      content: const Text("メッセージ"),
      actions: <Widget>[
        CupertinoDialogAction(
          child: const Text("キャンセル"),
          isDestructiveAction: false,
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoDialogAction(
          child: const Text("OK"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    return dialog;
  }
}
