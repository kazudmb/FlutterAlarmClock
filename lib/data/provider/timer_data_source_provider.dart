import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/data/local/timer_data_source_impl.dart';
import 'package:light_alarm/data/provider/app_database_provider.dart';

final timerDataSourceProvider =
    Provider((ref) => TimerDataSourceImpl(ref.read(databaseProvider)));
