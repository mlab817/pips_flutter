import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pips_flutter/app/config.dart';
import 'package:pips_flutter/data/data_source/shared_prefs_data_source.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = 'application/json';
const String contentType = 'content-type';
const String accept = 'accept';
const String authorization = 'authorization';
const String defaultLanguage = 'language';
const String bearer = 'Bearer';

class DioFactory {
  final SharedPrefsDataSource _appPreferences;

  DioFactory(this._appPreferences);

  // return dio instance
  Future<Dio> getDio() async {
    Dio dio = Dio();

    int timeOut = 60 * 1000; // 1min

    String language = await _appPreferences.getAppLanguage();

    String token = await _appPreferences.getUserToken();

    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization: "$bearer $token",
      defaultLanguage: language, // TODO: get lang from app prefs
    };

    dio.options = BaseOptions(
      baseUrl: Config.baseUrl,
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      headers: headers,
    );

    // add pretty logger as interceptor
    if (kReleaseMode) {
      print("release mode no logs");
    } else {
      dio.interceptors.add(PrettyDioLogger(
        request: true,
        // requestHeader: true,
        // requestBody: true,
        responseBody: false,
        // responseHeader: true,
        // responseBody: true,
        compact: true,
        error: true,
      ));
    }

    return dio;
  }
}
