import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/constants/theme_dart.dart';
import 'package:light_alarm/util/async_snapshot.dart';
import 'package:light_alarm/viewmodel/alarm_view_model.dart';
import 'package:light_alarm/viewmodel/loading_state_view_model.dart';

final counterProvider = StateProvider((ref) => 0);

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.pageBackgroundColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Alarm',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w700,
                  color: CustomColors.primaryTextColor,
                  fontSize: 24),
            ),
            Expanded(
              child: HookBuilder(
                builder: (context) {
                  print('HookBuilder test');
                  final alarmViewModel =
                      context.read(alarmViewModelNotifierProvider);
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
                      }, [user?.toString()]),
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
                    return const Text('Empty screen');
                  }

                  // TODO(dmb): 型がresultになっているのでその調査
                  // return user.when(success: (data) {
                  //   if (data.alarms.isEmpty) {
                  //     return const Text('Empty screen');
                  //   }
                  //   return ListView.builder(
                  //     itemCount: 1,
                  //     itemBuilder: (_, index) {
                  //       return AlarmItem(data.alarms[index]);
                  //     },
                  //   );
                  // }, failure: (e) {
                  //   return Text('Error Screen: $e');
                  // });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
