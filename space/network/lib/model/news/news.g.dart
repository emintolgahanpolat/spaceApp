// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      id: json['id'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      imageUrl: json['imageUrl'] as String?,
      newsSite: json['newsSite'] as String?,
      summary: json['summary'] as String?,
      publishedAt: json['publishedAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      featured: json['featured'] as bool?,
      launches: json['launches'] as List<dynamic>?,
      events: json['events'] as List<dynamic>?,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
      'newsSite': instance.newsSite,
      'summary': instance.summary,
      'publishedAt': instance.publishedAt,
      'updatedAt': instance.updatedAt,
      'featured': instance.featured,
      'launches': instance.launches,
      'events': instance.events,
    };
