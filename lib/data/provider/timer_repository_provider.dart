import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/data/provider/timer_data_source_provider.dart';
import 'package:light_alarm/data/repository/timer_repository.dart';
import 'package:light_alarm/data/repository/timer_repository_impl.dart';

final timerRepositoryProvider = Provider<TimerRepository>((ref) =>
    TimerRepositoryImpl(timerDataSource: ref.read(timerDataSourceProvider)));
