import 'package:json_annotation/json_annotation.dart';

part 'launch.g.dart';

@JsonSerializable()
class Launch {
  String? id;
  String? provider;

  Launch({this.id, this.provider});

  factory Launch.fromJson(Map<String, dynamic> json) {
    return _$LaunchFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LaunchToJson(this);
}
