import 'package:flutter/material.dart';
import 'package:light_alarm/model/Alarm.dart';
import 'package:light_alarm/model/repository/alarm_data_source.dart';
import 'package:light_alarm/model/repository/alarm_repository.dart';

class AlarmRepositoryImpl implements AlarmRepository {
  AlarmRepositoryImpl({@required AlarmDataSource dataSource})
      : _dataSource = dataSource;

  final AlarmDataSource _dataSource;

  @override
  Future<Alarm> getAlarm() async {
    return _dataSource.getAlarm();
  }
}
