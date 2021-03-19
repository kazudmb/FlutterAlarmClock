import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/model/repository/alarm_data_source.dart';
import 'package:light_alarm/model/repository/alarm_data_source_impl.dart';

import 'dio_provider.dart';

final alarmDataSourceProvider = Provider<AlarmDataSource>(
    (ref) => AlarmDataSourceImpl(dio: ref.read(dioProvider)));
