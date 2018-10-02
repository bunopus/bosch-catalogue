import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:web_app/paintings_service.dart';

@Component(
  selector: 'header',
  templateUrl: 'header_component.html',
  styleUrls: const ['header_component.css'],
  directives: const [NgStyle],
)
class HeaderComponent {
  final PaintingsService _service;
  final Router _router;

  HeaderComponent(this._service, this._router) {
    this._router.onRouteActivated.listen((RouterState state) async {
      if(state.path.startsWith('/painting/')) {
        var id = state.parameters['id'];
        var item = await _service.getPainting(int.parse(id));
        setBackground(item['big-preview']);
      }
      else {
        setBackground();
      }
    });
    setBackground();
  }

  Map<String, String> currentStyle = <String, String>{};
  String title = 'BOSCH PAINTINGS';

  void setBackground([String bg ='static/images/title_image.png']) {
    currentStyle = <String, String>{
      'background-image': 'url(\'$bg\')'
    };
  }

}
