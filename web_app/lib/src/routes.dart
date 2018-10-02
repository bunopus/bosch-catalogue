import 'package:angular_router/angular_router.dart';

final paintingsRoutePath = new RoutePath(
  path: '/',
  useAsDefault: true,
);

final paintingDetailRoutePath = new RoutePath(path: '/painting/:id');
