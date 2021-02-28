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
      title: Text("削除しますか？"),
      content: Text("メッセージ"),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text("キャンセル"),
          isDestructiveAction: false,
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoDialogAction(
          child: Text("OK"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    return dialog;
  }
}
