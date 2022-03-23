import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space/pages/detail/detail_provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailProvider>(builder: (c, s, w) {
      return Scaffold(
        appBar: AppBar(
          title: FittedBox(child: Text(s.news.title ?? "")),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: CachedNetworkImage(
                  imageUrl: s.news.imageUrl!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(s.news.summary ?? ""),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                    "${s.news.summary}${s.news.summary}${s.news.summary}${s.news.summary}${s.news.summary}${s.news.summary}${s.news.summary}${s.news.summary}${s.news.summary}${s.news.summary}${s.news.summary}${s.news.summary}${s.news.summary}${s.news.summary}${s.news.summary}${s.news.summary}${s.news.summary}${s.news.summary}"),
              )
            ],
          ),
        ),
      );
    });
  }
}
