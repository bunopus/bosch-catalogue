import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:angular/angular.dart';

/// Represents the base URL for HTTP requests using [PaintingsService].
const OpaqueToken<String> baseUrl = const OpaqueToken<String>('baseUrl');

const String defaultBaseUrl = 'http://localhost:8000/api/get_paintings';

class PaintingsService {
  final String _baseUrl;

  // Store paintings in memory to instantly load when requested.
  List<Map> _cachePaintingsResult;

  PaintingsService(@baseUrl this._baseUrl);

  Future<List<Map>> getPaintings() async {
    final url = '$_baseUrl';
    if (_cachePaintingsResult != null) {
      return _cachePaintingsResult;
    }
    final response = await HttpRequest.getString(url);
    final decoded = json.decode(response);
    return _cachePaintingsResult = decoded['paintings'].cast<Map>();
  }

  Future<Map> getPainting(int id) {
    var item = _cachePaintingsResult.firstWhere((Map item) => item['id'] == id);
    return new Future.value(item);
  }
}
