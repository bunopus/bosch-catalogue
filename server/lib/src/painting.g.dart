// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'painting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Painting _$PaintingFromJson(Map<String, dynamic> json) {
  return Painting(
      json['title'] as String,
      (json['tags'] as List).map((e) => e as String).toList(),
      json['description'] as String,
      json['preview'] as String,
      json['big-preview'] as String)
    ..id = json['id'] as int;
}

Map<String, dynamic> _$PaintingToJson(Painting instance) => <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'tags': instance.tags,
      'description': instance.description,
      'preview': instance.preview,
      'big-preview': instance.bigPreview
    };
