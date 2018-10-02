// Ignore generated templates imported for route definitions.
// ignore_for_file: uri_has_not_been_generated

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:web_app/src/header_component.dart';

import 'src/paintings_component.template.dart' as paintings;
import 'src/painting_detail_component.template.dart' deferred as painting_detail;
import 'src/routes.dart';

@Component(
  selector: 'app',
  templateUrl: 'app_component.html',
  directives: const [routerDirectives, HeaderComponent],
  styleUrls: const ['app_component.css'],
  // Disabled. We use global styles that are used before the JavaScript loads.
  //
  // See web/index.html's <style> tag.
  encapsulation: ViewEncapsulation.None,
)
class AppComponent {
  static final paintingsUrl = paintingsRoutePath.toUrl();

  static final routes = [
    new RouteDefinition(
      routePath: paintingsRoutePath,
      component: paintings.PaintingsComponentNgFactory,
    ),
    new RouteDefinition.defer(
      routePath: paintingDetailRoutePath,
      loader: () async {
        await painting_detail.loadLibrary();
        return painting_detail.PaintingDetailComponentNgFactory;
      },
    ),
  ];
}
