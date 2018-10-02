// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'painting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Painting _$PaintingFromJson(Map<String, dynamic> json) {
  return $checkedNew('Painting', json, () {
    var val = Painting(
        $checkedConvert(json, 'title', (v) => v as String),
        $checkedConvert(
            json, 'tags', (v) => (v as List).map((e) => e as String).toList()),
        $checkedConvert(json, 'description', (v) => v as String),
        $checkedConvert(json, 'preview', (v) => v as String),
        $checkedConvert(json, 'big-preview', (v) => v as String));
    return val;
  }, fieldKeyMap: const {'bigPreview': 'big-preview'});
}

Map<String, dynamic> _$PaintingToJson(Painting instance) => <String, dynamic>{
      'title': instance.title,
      'tags': instance.tags,
      'description': instance.description,
      'preview': instance.preview,
      'big-preview': instance.bigPreview
    };
