import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:models/models.dart';

import '../paintings_service.dart';

@Component(
  selector: 'painting-detail',
  templateUrl: 'painting_detail_component.html',
  styleUrls: const ['painting_detail_component.css'],
  directives: const [NgFor, NgIf],
)
class PaintingDetailComponent implements OnActivate {
  final PaintingsService _paintingsService;

  Painting painting;
  List<String> tags;

  PaintingDetailComponent(this._paintingsService);

  @override
  Future onActivate(_, RouterState current) async {
    final id = current.parameters['id'];
    painting = await _paintingsService.getPainting(int.parse(id));
    tags = getCharacters(painting.tags);
  }

  List<String> getCharacters(List<dynamic> characters) => characters.cast<String>();
}
