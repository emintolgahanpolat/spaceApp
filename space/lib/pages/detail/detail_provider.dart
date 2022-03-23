import 'package:flutter/material.dart';
import 'package:network/model/news/news.dart';

class DetailProvider extends ChangeNotifier {
  News news;
  DetailProvider(this.news);
}
