import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/constants/theme_dart.dart';
import 'package:light_alarm/model/repository/alarm_helper.dart';
import 'package:light_alarm/view/molecules/alarm_item.dart';
import 'package:light_alarm/viewmodel/alarm_view_model.dart';

final counterProvider = StateProvider((ref) => 0);

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  void initState() {
    print('AlarmPage initState()');
    super.initState();
    // TODO(dmb): dbの初期化を、viewに置きたくない
    AlarmHelper().initializeDatabase().then((value) {
      print('------database intialized');
    });
  }

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

                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (_, index) {
                      return AlarmItem(alarmViewModel.user!.alarms[index]);
                    },
                  );
                  return const Center(
                    child: Text(
                      'Loading..',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
