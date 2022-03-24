import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:network/api/logger_interceptor.dart';

class ApiClient {
  static Dio? _dio;
  static Dio get dio {
    _dio ??= Dio();
    if (kDebugMode) {
      _dio!.interceptors.add(LoggerInterceptor());
    }
    return _dio!;
  }
}
