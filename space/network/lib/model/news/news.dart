import 'package:json_annotation/json_annotation.dart';

import 'event.dart';
import 'launch.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  int? id;
  bool? featured;
  String? title;
  String? url;
  String? imageUrl;
  String? newsSite;
  String? summary;
  String? publishedAt;
  List<Launch>? launches;
  List<Event>? events;

  News({
    this.id,
    this.featured,
    this.title,
    this.url,
    this.imageUrl,
    this.newsSite,
    this.summary,
    this.publishedAt,
    this.launches,
    this.events,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
