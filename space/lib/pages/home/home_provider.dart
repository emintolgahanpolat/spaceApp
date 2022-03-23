import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:network/logger.dart';
import 'package:network/model/news/news.dart';
import 'package:network/repo/news_repository.dart';
import 'package:network/resource.dart';

class HomeProvider extends ChangeNotifier {
  final NewsRepository _newsRepository;
  HomeProvider(this._newsRepository);
  int limit = 10;
  int page = 1;

  final List<News> _items = [];
  List<News> get items => _items;
  void addItems(List<News> items) {
    _items.addAll(items);
    notifyListeners();
  }

  bool isLoading = false;
  bool stop = false;
  Future getData() async {
    if (isLoading) return;
    if (stop) return;
    isLoading = true;
    var res = await _newsRepository.getNewsList(limit, page++);
    stop = res.isEmpty;
    addItems(res);
    isLoading = false;
  }

/*
  Stream<Resource<List<News>?>> get itemList =>
      _newsRepository.getList(30, page++);

  void fData() {
    _newsRepository.getList(limit, page++).listen((event) {
      if (event.status == StatusEnum.success) {
        addItems(event.data!);
      }
    });
  }
*/
  bool _isGrid = true;
  bool get isGrid => _isGrid;
  void switchGrid() {
    _isGrid = !isGrid;
    notifyListeners();
  }
}
