import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:network/api/api_service.dart';
import 'package:network/api/logger_interceptor.dart';
import 'package:network/repo/news_repository.dart';
import 'package:space/pages/detail/detail_viewmodel.dart';
import 'package:space/pages/home/home_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() {
    Dio _dio = Dio();
    if (kDebugMode) {
      _dio.interceptors.add(LoggerInterceptor());
    }
    return _dio;
  });
  locator.registerLazySingleton(() => GetStorage());
  locator.registerLazySingleton(() => ApiService(locator<Dio>()));
  locator.registerLazySingleton(
      () => NewsRepository(locator<ApiService>(), locator<GetStorage>()));

  locator.registerFactory(() => HomeProvider(locator<NewsRepository>()));
  locator.registerFactory(() => DetailViewModel(locator<NewsRepository>()));
}
