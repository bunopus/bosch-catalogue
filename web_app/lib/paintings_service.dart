import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:models/models.dart';

/// Represents the base URL for HTTP requests using [PaintingsService].
const OpaqueToken<String> baseUrl = const OpaqueToken<String>('baseUrl');

const String defaultBaseUrl = 'http://localhost:8000/api/get_paintings';

class PaintingsService {
  final String _baseUrl;

  // Store paintings in memory to instantly load when requested.
  Paintings _cachePaintingsResult;

  PaintingsService(@baseUrl this._baseUrl);

  Future<Paintings> getPaintings() async {
    final url = '$_baseUrl';
    if (_cachePaintingsResult != null) {
      return _cachePaintingsResult;
    }
    final response = await HttpRequest.getString(url);
    final decoded = json.decode(response);
    return _cachePaintingsResult = new Paintings.fromJson(decoded);
  }

  Future<Painting> getPainting(int id) {
    var item = _cachePaintingsResult.paintings.firstWhere((Painting item) => item.id == id);
    return new Future.value(item);
  }
}
