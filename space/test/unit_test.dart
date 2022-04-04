import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:space/infrastructure/model/news/news.dart';
import 'package:space/infrastructure/repo/i_news_repository.dart';
import 'package:space/infrastructure/resource.dart';
import 'package:space/pages/home/home.dart';
import 'package:space/pages/home/home_vm.dart';

class FakeNewsRepository extends INewsRepository {
  List<News> items = [];
  @override
  void deleteNews(News news) {}

  @override
  Stream<Resource<List<News>?>> getList(int limit, int start) {
    return Stream.value(Resource.success(items));
  }

  @override
  Future<News> getNews(String id) {
    return Future.value(items.firstWhere((e) => e.id.toString() == id));
  }

  @override
  Future<List<News>> getNewsList(int limit, int start) {
    return Future.value(items);
  }

  @override
  void insertNews(News news) {
    return items.add(news);
  }
}

void main() {
  group('Home Test', () {
    final locator = GetIt.instance;
    locator.registerLazySingleton(() => FakeNewsRepository());
    HomeViewModel viewModel = HomeViewModel(locator<FakeNewsRepository>());
    locator.registerFactory(() => viewModel);

    test('Haber Ekle', () {
      var item = News(title: "1");
      viewModel.addItems([item]);
      viewModel.addItems([News(title: "2")]);
      viewModel.addItems([News(title: "3")]);
      viewModel.addItems([News(title: "4")]);
      viewModel.addItems([News(title: "5")]);
      viewModel.addItems([News(title: "6")]);
      viewModel.addItems([News(title: "7")]);
      viewModel.addItems([News(title: "8")]);
      viewModel.addItems([News(title: "9")]);
      viewModel.addItems([News(title: "10")]);
      viewModel.addItems([News(title: "11")]);
      viewModel.addItems([News(title: "12")]);
      viewModel.addItems([News(title: "12")]);
      expect(viewModel.items.contains(item), true);
      expect(viewModel.items.length, 13);
    });

    testWidgets('Scroll  test ', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(),
      ));

      expect(find.text('Space'), findsOneWidget);

      expect(find.text('1'), findsOneWidget);
      await tester.fling(find.byType(GridView), const Offset(0, -100), 5000);
      await tester.pumpAndSettle();
      expect(find.text('1'), findsNothing);
    });
  });
}
