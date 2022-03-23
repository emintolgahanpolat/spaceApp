import 'package:network/model/news/news.dart';
import 'package:network/resource.dart';

abstract class INewsRepository {
  Future<List<News>> getNewsList(int limit, int start);
  Future<void> insertNews(News news);
  void deleteNews(News news);
  Future<News> getNews(String id);

  Stream<Resource<List<News>?>> getList(int limit, int start);
}
