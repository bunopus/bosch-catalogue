import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:models/models.dart';

import '../paintings_service.dart';

@Component(
  selector: 'paintins',
  templateUrl: 'paintings_component.html',
  styleUrls: const ['paintings_component.css'],
  directives: const [NgFor, NgIf, routerDirectives],
)
class PaintingsComponent implements OnActivate {
  final PaintingsService _paintingsService;

  Paintings items;

  PaintingsComponent(this._paintingsService);

  String getPaintingLink(item) {
    return '/painting/${item.id}';
  }

  @override
  Future onActivate(_, RouterState current) async {
    items = await _paintingsService.getPaintings();
  }
}
