import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/model/repository/alarm.dart';

final alarmViewModelNotifierProvider = ChangeNotifierProvider((ref) =>
    AlarmViewModel(ref, repository: ref.read(alarmDataSourceProvider)));

class AlarmViewModel extends ChangeNotifier {
  AlarmViewModel({@required Alarm repository}) : _repository = repository;

  final Alarm _repository;

  Alarm _alarm;

  Alarm get alarm => _alarm;

  Future<void> fetchAlarm() async {
    return _repository
        .getAlarm()
        .then((value) {
          _alarm = value;
        })
        .catchError((dynamic error) {})
        .whenComplete(() => notifyListeners());
  }
}
