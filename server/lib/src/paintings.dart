import 'package:json_annotation/json_annotation.dart';
import 'package:server/src/painting.dart';
part 'paintings.g.dart';

@JsonSerializable()
class Paintings {
  List<Painting> paintings;

  Paintings(this.paintings);

  factory Paintings.fromJson(Map<String, dynamic> json) => _$PaintingsFromJson(json);

  Map<String, dynamic> toJson() => _$PaintingsToJson(this);
}