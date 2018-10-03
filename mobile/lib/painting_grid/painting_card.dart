import 'package:flutter/material.dart';
import 'package:mobile/utils/utils.dart';
import 'package:models/models.dart';


class SWStyle extends TextStyle {
  const SWStyle({
    double fontSize: 12.0,
    FontWeight fontWeight,
    Color color: Colors.black87,
    double letterSpacing,
    double height,
  }) : super(
    inherit: false,
    color: color,
    fontFamily: 'Raleway',
    fontSize: fontSize,
    fontWeight: fontWeight,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: letterSpacing,
    height: height,
  );
}


class PaintingCard extends StatelessWidget {
  final TextStyle titleStyle = const SWStyle(
      fontSize: 24.0, fontWeight: FontWeight.w600);
  final TextStyle authorStyle = const SWStyle(
      fontWeight: FontWeight.w500, color: Colors.black54);

  const PaintingCard({ Key key, this.painting, this.onTap }) : super(key: key);

  final Painting painting;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    final decodedPoster = strToBase64(painting.preview);
    final TextStyle titleStyle = const SWStyle(
        fontSize: 24.0, fontWeight: FontWeight.w600);
    return new GestureDetector(
      onTap: onTap,
      child: new Card(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Expanded(child: new Hero(
                tag: '${painting.title} - ${painting.id}',

                child: new Container(
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                          fit: BoxFit.fitWidth,
                          alignment: FractionalOffset.topCenter,
                          image: new MemoryImage(decodedPoster),
                        )
                    )
                )),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0), child: new ListTile(
              leading: const Icon(Icons.format_paint, color: const Color(0xFF790A12)),
              title: new Text(painting.title, style: titleStyle, softWrap: true),
              subtitle: new Text(
                  painting.tags.join(", "), softWrap: false,
                  overflow: TextOverflow.ellipsis),

            ),
            )

          ],
        ),
      ),
    );
  }
}