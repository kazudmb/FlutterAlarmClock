import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/model/repository/user_repository.dart';

class DatabaseProviderImpl implements UserRepository {
  final databaseProvider = Provider<Dio>((_) => AppDio.getInstance());
}
