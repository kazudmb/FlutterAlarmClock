import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/model/repository/user_repository.dart';
import 'package:light_alarm/model/repository/user_repository_impl.dart';

final userRepositoryProvider = Provider<UserRepository>(
    (ref) => UserRepositoryImpl(database: ref.read(databaseProvider)));
