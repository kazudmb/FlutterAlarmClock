import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/data/provider/user_data_source_provider.dart';
import 'package:light_alarm/data/repository/user_repository.dart';
import 'package:light_alarm/data/repository/user_repository_impl.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) =>
    UserRepositoryImpl(userDataSource: ref.read(userDataSourceProvider)));
