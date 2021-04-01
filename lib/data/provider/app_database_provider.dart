import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_alarm/data/local/app_database.dart';

final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase());
