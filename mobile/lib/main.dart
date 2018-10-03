import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/painting_grid/painting_grid.dart';
import 'package:models/models.dart';


Future<Paintings> fetchMovies() async {
  final response = await http.get('http://10.0.2.2:8000/api/get_paintings');
  final responseJson = json.decode(response.body);

  return new Paintings.fromJson(responseJson);
}

class BoschPaintings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Bosch paintings',
      home: new Scaffold(
        body: new Center(
          child: new FutureBuilder<Paintings>(
            future: fetchMovies(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new PaintingsGridPage(painting: snapshot.data.paintings);
              } else if (snapshot.hasError) {
                return new Text("${snapshot.error}");
              }
              // By default, show a loading spinner
              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(new BoschPaintings());
}
