import 'package:flutter/material.dart';
import 'package:space/infrastructure/model/news/news.dart';
import 'package:space/infrastructure/repo/i_news_repository.dart';

class DetailViewModel extends ChangeNotifier {
  final INewsRepository _newsRepository;
  DetailViewModel(this._newsRepository);
  News? _news;
  News? get news => _news;
  void setNews(News news) {
    _news = news;
    notifyListeners();
  }

  void fetchData(String id) {
    _newsRepository.getNews(id).then((value) {
      setNews(value);
    });
  }
}
