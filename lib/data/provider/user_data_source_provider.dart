import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/data/local/user_data_source_impl.dart';
import 'package:light_alarm/data/provider/app_shared_preferences_provider.dart';

final userDataSourceProvider =
    Provider((ref) => UserDataSourceImpl(ref.read(prefsProvider)));
