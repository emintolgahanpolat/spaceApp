import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:network/api/api_service.dart';
import 'package:network/model/news/news.dart';
import 'package:network/network_bound_resource.dart';
import 'package:network/repo/i_news_repository.dart';
import 'package:network/resource.dart';

class NewsRepository extends INewsRepository {
  final ApiService _apiService;
  final GetStorage _getStorage;
  NewsRepository(this._apiService, this._getStorage);

  @override
  void deleteNews(News news) {}

  @override
  void insertNews(News news) {}

  @override
  Future<List<News>> getNewsList(int limit, int start) async {
    return _apiService.fetchNewsList(limit, start);
  }

  @override
  Future<News> getNews(String id) async {
    return _apiService.fetchNews(id);
  }

  @override
  Stream<Resource<List<News>?>> getList(int limit, int start) {
    return NetworkBoundResource<List<News>, List<News>>().asStream(
        saveCallResult: (result) {
          _getStorage.write("nasa", jsonEncode(result));
        },
        shouldFetch: (data) =>
            data == null || data.isEmpty || data.length < limit * start,
        loadFromDb: () {
          String? res = _getStorage.read("nasa");
          List<News> data = [];
          if (res != null) {
            data =
                List<News>.from(jsonDecode(res).map((x) => News.fromJson(x)));
          }
          return Future.value(data);
        },
        createCall: () => _apiService.fetchNewsList(limit, start));
  }
}
