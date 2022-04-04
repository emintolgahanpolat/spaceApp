import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:space/infrastructure/api/api_service.dart';
import 'package:space/infrastructure/api/logger_interceptor.dart';
import 'package:space/infrastructure/repo/news_repository.dart';
import 'package:space/pages/detail/detail_vm.dart';
import 'package:space/pages/home/home_vm.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:space/pages/root/root_vm.dart';

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

  locator.registerFactory(() => HomeViewModel(locator<NewsRepository>()));
  locator.registerFactory(() => DetailViewModel(locator<NewsRepository>()));
  locator.registerFactory(() => RootViewModel());
}
