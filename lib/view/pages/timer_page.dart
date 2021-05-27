import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:light_alarm/constants/theme_dart.dart';
import 'package:light_alarm/viewmodel/timer_view_model.dart';
import 'package:logger/logger.dart';

final counterProvider = StateProvider((ref) => 0);

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    final timerViewModel = context.read(timerViewModelNotifierProvider);
    return Scaffold(
      backgroundColor: CustomColors.pageBackgroundColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            HookBuilder(builder: (context) {
              final timer = useProvider(timerViewModelNotifierProvider
                  .select((value) => value.timer));
              if (timer == null) {
                return Container(
                  height: 300,
                  child: CupertinoTimerPicker(
                      mode: CupertinoTimerPickerMode.hms,
                      onTimerDurationChanged: (value) {
                        timerViewModel.countDownTime = value;
                      }),
                );
              } else {
                // TODO(dmb): カウントダウンロジックの実装
                return Text(
                  DateFormat.Hms().format(timerViewModel.countDownDateTime),
                  style: Theme.of(context).textTheme.headline2,
                );
              }
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  child: const Text('キャンセル'),
                  onPressed: () {
                    print('onPressed');
                    timerViewModel.cancelTimer();
                    timerViewModel.deleteTimer();
                  },
                ),
                HookBuilder(
                  builder: (context) {
                    final timer = useProvider(timerViewModelNotifierProvider
                        .select((value) => value.timer));
                    if (timer == null) {
                      return TextButton(
                        child: const Text('スタート'),
                        onPressed: () {
                          timerViewModel.setCountDownDateTime(
                              timerViewModel.countDownTime);
                          timerViewModel.saveTimer(
                              DateTime.now().add(timerViewModel.countDownTime));
                        },
                      );
                    } else {
                      // TODO(dmb): 一時停止・再開の切り替えを実装すること
                      return TextButton(
                        child: const Text('一時停止'),
                        onPressed: () {
                          print('onPressed');
                          // TODO(dmb): 一時停止処理を追加すること
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
