import 'package:json_annotation/json_annotation.dart';
part 'painting.g.dart';

@JsonSerializable(nullable: false)
class Painting {
  String title;
  List<String> tags;
  String description;
  String preview;

  @JsonKey(name:'big-preview')
  String bigPreview;

  Painting(this.title, this.tags, this.description, this.preview, this.bigPreview);

  factory Painting.fromJson(Map<String, dynamic> json) => _$PaintingFromJson(json);

}