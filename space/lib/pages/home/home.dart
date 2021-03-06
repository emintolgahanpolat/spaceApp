import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:space/infrastructure/model/news/news.dart';
import 'package:space/pages/base_view.dart';
import 'package:space/pages/home/home_vm.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(onModelReady: (s) {
      s.getData();
    }, builder: (c, viewModel, w) {
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                context
                    .findRootAncestorStateOfType<ScaffoldState>()
                    ?.openDrawer();
              },
            ),
            title: const Text("Space"),
            actions: [
              IconButton(
                  onPressed: viewModel.switchGrid,
                  icon: Icon(
                      viewModel.isGrid ? Icons.grid_3x3_rounded : Icons.list)),
            ],
          ),
          body: NotificationListener<ScrollNotification>(
            onNotification: (scroll) {
              if (scroll.metrics.maxScrollExtent == scroll.metrics.pixels) {
                viewModel.getData();
              }
              return false;
            },
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: viewModel.isGrid ? 2 : 1,
                    childAspectRatio: viewModel.isGrid ? 1 : 16 / 9),
                itemCount: viewModel.items.length,
                itemBuilder: (c, i) {
                  News item = viewModel.items[i];

                  return InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed("/detail", arguments: "${item.id}");
                    },
                    child: Stack(
                      children: [
                        AspectRatio(
                            aspectRatio: 16 / 9,
                            child: CachedNetworkImage(
                              imageUrl: item.imageUrl ?? "",
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                color: Colors.grey,
                              ),
                            )),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            color: Colors.black.withOpacity(0.6),
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              item.title ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                  /*  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, "/detail",
                            arguments: "${item.id}");
                      },
                      leading: AspectRatio(
                        aspectRatio: 1,
                        child:
                            CachedNetworkImage(imageUrl: item.imageUrl ?? ""),
                      ),
                      title: Text(item.title ?? ""),
                    ),
                  );*/
                }),
          ));
    });
  }
}
    /*
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
 body: ResourceStream<Resource<List<News>?>>(
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