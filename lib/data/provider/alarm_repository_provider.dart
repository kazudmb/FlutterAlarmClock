import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/data/provider/alarm_data_source_provider.dart';
import 'package:light_alarm/data/repository/alarm_repository.dart';
import 'package:light_alarm/data/repository/alarm_repository_impl.dart';

final alarmRepositoryProvider = Provider<AlarmRepository>((ref) =>
    AlarmRepositoryImpl(alarmDataSource: ref.read(alarmDataSourceProvider)));
