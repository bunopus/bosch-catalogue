import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

// We are ignoring files that will be generated at compile-time.
// ignore: uri_has_not_been_generated, uri_does_not_exist
import 'package:web_app/app_component.template.dart' as app;
import 'package:web_app/paintings_service.dart';

// We are ignoring files that will be generated at compile-time.
// ignore: uri_has_not_been_generated
import 'main.template.dart' as ng;

@GenerateInjector(const [
  // HTTP and Services.
  const FactoryProvider(PaintingsService, getPaintingsService),

  // SPA Router.
  routerProviders,
])
final InjectorFactory paintingsApp = ng.paintingsApp$Injector;

PaintingsService _service;
PaintingsService getPaintingsService() => _service;

void main() async {
  _service = new PaintingsService(defaultBaseUrl);

  Future future;
  final path = window.location.pathname;

  // prefetch everything
  if (window.location.search.isEmpty && !path.startsWith('/painting')) {
    future = _service.getPaintings();
  }

  // Start app after fetched.
  await future;

  runApp(
    app.AppComponentNgFactory,
    createInjector: paintingsApp,
  );
}
