import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/constants/theme_dart.dart';
import 'package:light_alarm/util/async_snapshot.dart';
import 'package:light_alarm/view/molecules/alarm_header.dart';
import 'package:light_alarm/view/molecules/alarm_item.dart';
import 'package:light_alarm/viewmodel/alarm_view_model.dart';
import 'package:light_alarm/viewmodel/loading_state_view_model.dart';

class AlarmPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final alarmViewModel = context.read(alarmViewModelNotifierProvider);
    return Scaffold(
      appBar: AlarmHeader(alarmViewModel),
      backgroundColor: CustomColors.pageBackgroundColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: HookBuilder(
                builder: (context) {
                  final user = useProvider(alarmViewModelNotifierProvider
                      .select((value) => value.user));
                  final alarms = useProvider(alarmViewModelNotifierProvider
                      .select((value) => value.alarms));
                  final userSnapshot = useFuture(
                      useMemoized(() {
                        return context
                            .read(loadingStateProvider)
                            .whileLoading(alarmViewModel.fetchUser);
                      }, [user?.toString()]),
                      initialData: null);
                  final alarmsSnapshot = useFuture(
                      useMemoized(() {
                        return context
                            .read(loadingStateProvider)
                            .whileLoading(alarmViewModel.fetchAlarm);
                      }, [alarms?.toString()]),
                      initialData: null);

                  // Not yet load the contents.
                  if (!userSnapshot.isDone ||
                      !alarmsSnapshot.isDone ||
                      user == null) {
                    return const Center(
                      child: Text(
                        'Loading..',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    if (alarms == null || alarms.isEmpty) {
                      return const Text('Empty screen');
                    }
                    return ListView.builder(
                      itemCount: alarms.length,
                      itemBuilder: (_, index) {
                        return AlarmItem(alarmViewModel, alarms[index]);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      // TODO(dmb): タイマーを実装する段階で追加すること
      // bottomNavigationBar: const AlarmFooter(),
    );
  }
}
