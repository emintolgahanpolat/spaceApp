import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:network/model/news/news.dart';
import 'package:network/resource.dart';
import 'package:space/main_provider.dart';
import 'package:provider/provider.dart';
import 'package:space/pages/base_view.dart';
import 'package:space/pages/home/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeProvider>(onModelReady: (s) {
      s.getData();
      //s.fData();
    }, builder: (c, s, w) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Space"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/test");
                  },
                  icon: const Icon(Icons.settings)),
              IconButton(
                  onPressed: s.switchGrid,
                  icon: Icon(s.isGrid ? Icons.grid_3x3_rounded : Icons.list)),
              IconButton(
                  onPressed: context.read<MainProvider>().switchDart,
                  icon: Icon(context.watch<MainProvider>().isDart
                      ? Icons.dark_mode
                      : Icons.light_mode))
            ],
          ),
          /* body: ResourceStream<Resource<List<News>?>>(
            stream: s.itemList,
            builder: (c, snapshot) {
              if (snapshot?.data != null) {
                return ListView.builder(
                    itemCount: snapshot?.data?.length ?? 0,
                    itemBuilder: (c, i) {
                      return ListTile(
                        title: Text(snapshot!.data![i].title ?? ""),
                      );
                    });
              }
              return const Center(child: CircularProgressIndicator());
            }),*/
          body: NotificationListener<ScrollNotification>(
            onNotification: (scroll) {
              if (scroll.metrics.maxScrollExtent == scroll.metrics.pixels) {
                s.getData();
              }
              return false;
            },
            child: ListView.builder(
                itemCount: s.items.length,
                itemBuilder: (c, i) {
                  News item = s.items[i];
                  return Card(
                    child: ListTile(
                      leading: AspectRatio(
                        aspectRatio: 1,
                        child:
                            CachedNetworkImage(imageUrl: item.imageUrl ?? ""),
                      ),
                      title: Text(item.title ?? ""),
                    ),
                  );
                }),
          ));
    });
  }
}

class ResourceStream<T> extends StatelessWidget {
  final Stream<T>? stream;
  final Widget Function(BuildContext, T?) builder;
  const ResourceStream({Key? key, this.stream, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (c, s) => builder(c, s.data),
    );
  }
}
