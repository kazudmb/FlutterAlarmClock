import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/model/repository/AlarmRepository.dart';
import 'package:light_alarm/model/repository/AlarmRepositoryImpl.dart';

final alarmRepositoryProvider = Provider<AlarmRepository>((ref) =>
    AlarmRepositoryImpl(dataSource: ref.read(alarmDataSourceProvider)));
