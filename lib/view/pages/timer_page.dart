import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:light_alarm/constants/theme_dart.dart';
import 'package:light_alarm/viewmodel/timer_view_model.dart';

class TimerPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final timerViewModel = useProvider(timerViewModelNotifierProvider);
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
                    timerViewModel.deleteTimer();
                    timerViewModel.fetchTimer();
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
                          DateTime currentTime = DateTime.now();
                          timerViewModel.startCountDown(currentTime,
                              notificationTime: currentTime
                                  .add(timerViewModel.countDownTime));
                        },
                      );
                    } else {
                      if (timerViewModel.isPauseTimer) {
                        return TextButton(
                          child: const Text('再開'),
                          onPressed: () {
                            timerViewModel.updatePauseStatus(false);
                          },
                        );
                      } else {
                        return TextButton(
                          child: const Text('一時停止'),
                          onPressed: () {
                            timerViewModel.updatePauseStatus(true);
                          },
                        );
                      }
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
