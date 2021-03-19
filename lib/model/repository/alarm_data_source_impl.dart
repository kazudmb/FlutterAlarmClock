import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:light_alarm/model/Alarm.dart';
import 'package:light_alarm/model/repository/alarm_data_source.dart';

class AlarmDataSourceImpl implements AlarmDataSource {
  AlarmDataSourceImpl({@required Dio dio}) : _dio = dio;

  final Dio _dio;

  // TODO: アラームをDBから取得する処理を書くこと
  @override
  Future<Alarm> getAlarm() async {
    return null;
    // return _dio
    //     .get<Map<String, dynamic>>(
    //   '/v2/everything',
    //   queryParameters: <String, String>{
    //     'q': 'anim',
    //     'from': DateTime.now()
    //         .subtract(
    //       const Duration(days: 28),
    //     )
    //         .toLocal()
    //         .formatYYYYMMdd(),
    //     'sortBy': 'publishedAt',
    //     'language': 'en',
    //     'apiKey': Constants.of().apiKey,
    //   },
    //   options: buildCacheOptions(const Duration(hours: 1)),
    // )
    //     .then((response) => Alarm.fromJson(response.data));
  }
}
