import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:server/src/database.dart';
import 'package:models/models.dart';

Future main() async {
  const port = 8000;

  final HttpServer server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    port,
  );

  print('Listening on ${port}');

  server.where((HttpRequest req) {
    return req.method == 'GET' && req.uri.toString() == '/api/get_paintings';
  }).listen(onData);
}

void onData(HttpRequest event) {
  final paintings = new Paintings.fromJson(Database.getPaintings());

  final encoded = paintings.toJson();

  event.response
    ..statusCode = HttpStatus.ok
    ..headers.add('Access-Control-Allow-Origin', '*')
    ..write(json.encode(encoded))
    ..close();
}



