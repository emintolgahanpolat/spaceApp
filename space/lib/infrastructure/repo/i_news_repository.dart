import 'package:space/infrastructure/model/news/news.dart';
import 'package:space/infrastructure/resource.dart';

abstract class INewsRepository {
  Future<List<News>> getNewsList(int limit, int start);
  void insertNews(News news);
  void deleteNews(News news);
  Future<News> getNews(String id);

  Stream<Resource<List<News>?>> getList(int limit, int start);
}
