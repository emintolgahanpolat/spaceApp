import 'package:network/model/news/news.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: "https://api.spaceflightnewsapi.net")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/v3/articles")
  Future<List<News>> fetchNewsList(
      @Query("_limit") int limit, @Query("_start") int start);

  @GET("/v3/articles")
  Future<News> fetchNews(@Query("id") String id);
}
