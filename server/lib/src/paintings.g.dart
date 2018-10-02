// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paintings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paintings _$PaintingsFromJson(Map<String, dynamic> json) {
  return $checkedNew('Paintings', json, () {
    var val = Paintings($checkedConvert(
        json,
        'paintings',
        (v) => (v as List)
            ?.map((dynamic e) =>
                e == null ? null : Painting.fromJson(e as Map<String, dynamic>))
            ?.toList()));
    return val;
  });
}

Map<String, dynamic> _$PaintingsToJson(Paintings instance) => <String, dynamic>{
      'paintings': instance.paintings?.map((e) => e?.toJson())?.toList()
    };
