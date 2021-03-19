import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/model/repository/alarm.dart';
import 'package:light_alarm/model/repository/alarm_repository.dart';
import 'package:light_alarm/model/repository/alarm_repository_provider.dart';

final alarmViewModelNotifierProvider = ChangeNotifierProvider(
    (ref) => AlarmViewModel(repository: ref.read(alarmRepositoryProvider)));

class AlarmViewModel extends ChangeNotifier {
  AlarmViewModel({@required AlarmRepository repository})
      : _repository = repository;

  final AlarmRepository _repository;

  Alarm _alarm;

  Alarm get alarm => _alarm;

  Future<void> fetchAlarm() async {
    return _repository
        .getAlarm()
        .then((value) {
          _alarm = value as Alarm;
        })
        .catchError((dynamic error) {})
        .whenComplete(() => notifyListeners());
  }
}
