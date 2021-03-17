import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/model/repository/AlarmDataSource.dart';
import 'package:light_alarm/model/repository/AlarmDataSourceImpl.dart';

import 'dio_provider.dart';

final alarmDataSourceProvider = Provider<AlarmDataSource>(
    (ref) => AlarmDataSourceImpl(dio: ref.read(dioProvider)));
