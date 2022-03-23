import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:space/pages/base_view.dart';
import 'package:space/pages/detail/detail_viewmodel.dart';

class DetailPage extends StatelessWidget {
  final String id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DetailViewModel>(onModelReady: (viewModel) {
      viewModel.fetchData(id);
    }, builder: (c, viewModel, w) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Detail"),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                viewModel.fetchData(id);
              },
            )
          ],
        ),
        body: viewModel.news == null
            ? Text("Loading")
            : SingleChildScrollView(
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: CachedNetworkImage(
                        imageUrl: viewModel.news!.imageUrl!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(viewModel.news!.summary ?? ""),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text("${viewModel.news!.summary}"),
                    )
                  ],
                ),
              ),
      );
    });
  }
}
