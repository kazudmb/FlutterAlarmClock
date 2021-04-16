import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:light_alarm/constants/theme_dart.dart';
import 'package:light_alarm/data/model/alarm.dart';
import 'package:light_alarm/viewmodel/alarm_view_model.dart';

class AlarmItem extends StatefulWidget {
  const AlarmItem(this._alarmViewModel, this._alarmInfo);
  final AlarmViewModel _alarmViewModel;
  final Alarm _alarmInfo;
  @override
  _AlarmItemState createState() => _AlarmItemState();
}

class _AlarmItemState extends State<AlarmItem> {
  @override
  Widget build(BuildContext context) {
    final alarmTime =
        DateFormat('hh:mm aa').format(widget._alarmInfo.alarmDateTime);
    final gradientColor = GradientTemplate
        .gradientTemplate[widget._alarmInfo.gradientColorIndex].colors;

    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: gradientColor.last.withOpacity(0.4),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(4, 4),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    widget._alarmInfo.title,
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'avenir'),
                  ),
                ],
              ),
              Switch(
                onChanged: (bool value) {
                  setState(() {
                    // TODO: ViewModelから取得したデータをセットすること
                    // _switchValue = value;
                    // TODO: スイッチを切り替えたタイミングでDBも更新すること
                    // updateIsPending(widget._alarmInfo.id, _switchValue ? 0 : 1);
                  });
                },
                // value: _switchValue,
                // TODO: スイッチの初期値を設定する方法を検討
                value: widget._alarmInfo.isPending == 0 ? false : true,
                activeColor: Colors.white,
              ),
            ],
          ),
          Text(
            widget._alarmInfo.repeat,
            style: const TextStyle(color: Colors.white, fontFamily: 'avenir'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                alarmTime,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'avenir',
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.white,
                  onPressed: () async {
                    bool? returnValue = await widget._alarmViewModel
                        .showAlarmDeleteConfirmDialog(context: context);
                    if (returnValue != null) {
                      if (returnValue) {
                        widget._alarmViewModel
                            .deleteAlarm((widget._alarmInfo.alarmId!));
                      }
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
