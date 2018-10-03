import 'package:flutter/material.dart';
import 'package:mobile/utils/utils.dart';
import 'package:models/models.dart';

class Poster extends StatelessWidget {
  static const POSTER_RATIO = 0.7;

  Poster(
    this.painting, {
        this.height = 100.0,
      });

  final Painting painting;
  final double height;

  @override
  Widget build(BuildContext context) {
    var width = POSTER_RATIO * height;

    return new Material(
      borderRadius: new BorderRadius.circular(4.0),
      elevation: 2.0,
      child: new Hero(
        tag: '${painting.title} - ${painting.id}',
        child: new Image.memory(
          strToBase64(painting.preview),
          fit: BoxFit.cover,
          width: width,
          height: height,
        ),
      )

//
//      new Image.memory(
//        strToBase64(posterData),
//        fit: BoxFit.cover,
//        width: width,
//        height: height,
//      ),
//


    );
  }
}
