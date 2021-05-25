import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/constants/theme_dart.dart';
import 'package:light_alarm/util/async_snapshot.dart';
import 'package:light_alarm/viewmodel/alarm_view_model.dart';
import 'package:light_alarm/viewmodel/loading_state_view_model.dart';
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
            HookBuilder(
              builder: (context) {
                final user = useProvider(alarmViewModelNotifierProvider
                    .select((value) => value.user));
                final timer = useProvider(timerViewModelNotifierProvider
                    .select((value) => value.timer));
                final userSnapshot = useFuture(
                    useMemoized(() {
                      return context
                          .read(loadingStateProvider)
                          .whileLoading(timerViewModel.fetchUser);
                    }, [user?.toString()]),
                    initialData: null);
                final timerSnapshot = useFuture(
                    useMemoized(() {
                      return context
                          .read(loadingStateProvider)
                          .whileLoading(timerViewModel.fetchTimer);
                    }, [timer?.toString()]),
                    initialData: null);

                // Not yet load the contents.
                if (!userSnapshot.isDone ||
                    !timerSnapshot.isDone ||
                    user == null) {
                  return Container(
                    height: 300,
                    child: CupertinoTimerPicker(
                        mode: CupertinoTimerPickerMode.hms,
                        onTimerDurationChanged: (value) {
                          print('onTimerDurationChanged' + value.toString());
                        }),
                  );
                } else {
                  if (timer == null) {
                    return Container(
                      height: 300,
                      child: CupertinoTimerPicker(
                          mode: CupertinoTimerPickerMode.hms,
                          onTimerDurationChanged: (value) {
                            print('onTimerDurationChanged' + value.toString());
                          }),
                    );
                  } else {
                    // TODO(dmb): カウントダウンUI
                    return Container(
                      height: 300,
                      child: CupertinoTimerPicker(
                          mode: CupertinoTimerPickerMode.hms,
                          onTimerDurationChanged: (value) {
                            print('onTimerDurationChanged' + value.toString());
                          }),
                    );
                  }
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  child: const Text('キャンセル'),
                  onPressed: () {
                    print('onPressed');
                  },
                ),
                TextButton(
                  child: const Text('スタート'),
                  onPressed: () {
                    print('onPressed');
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
