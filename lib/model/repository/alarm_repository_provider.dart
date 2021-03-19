import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/model/repository/alarm_repository.dart';
import 'package:light_alarm/model/repository/alarm_repository_impl.dart';

final alarmRepositoryProvider =
    Provider<AlarmRepository>((ref) => AlarmRepositoryImpl());
