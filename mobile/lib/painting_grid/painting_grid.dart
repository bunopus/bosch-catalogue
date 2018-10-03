
import 'package:flutter/material.dart';
import 'package:mobile/painting_details/painting_details_page.dart';
import 'package:mobile/painting_grid/painting_card.dart';
import 'package:models/models.dart';

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.red,
  accentColor: new Color.fromARGB(1, 180, 30, 42),
);

const double _kAppBarHeight = 200.0;
const double _kMoviePageMaxWidth = 500.0;

class PaintingsGridPage extends StatefulWidget {
  const PaintingsGridPage({ Key key, this.painting }) : super(key: key);

  final List<Painting> painting;

  @override
  _PaintingsGridPageState createState() => new _PaintingsGridPageState();
}

class _PaintingsGridPageState extends State<PaintingsGridPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    return new Theme(
      data: _kTheme.copyWith(platform: Theme
          .of(context)
          .platform),
      child: new Scaffold(
        key: scaffoldKey,
        body: new CustomScrollView(
          slivers: <Widget>[
            _buildAppBar(context, statusBarHeight),
            _buildBody(context, statusBarHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, double statusBarHeight) {
    return new SliverAppBar(
        pinned: true,
        expandedHeight: _kAppBarHeight,
        flexibleSpace: new LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return new Image.asset(
                  'assets/title_image.png', fit: BoxFit.cover);
            })
    );
  }

  Widget _buildBody(BuildContext context, double statusBarHeight) {
    final EdgeInsets mediaPadding = MediaQuery
        .of(context)
        .padding;
    final EdgeInsets padding = new EdgeInsets.only(
        top: 8.0,
        left: 8.0 + mediaPadding.left,
        right: 8.0 + mediaPadding.right,
        bottom: 8.0
    );
    return new SliverPadding(
      padding: padding,
      sliver: new SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _kMoviePageMaxWidth,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            final Painting painting = widget.painting[index];
            return new PaintingCard(
              painting: painting,
              onTap: () {
                showPaintingPage(context, painting);
              },
            );
          },
          childCount: widget.painting.length,
        ),
      ),
    );
  }

  void showPaintingPage(BuildContext context, Painting painting) {
    Navigator.push(context,
        new MaterialPageRoute<void>(
          settings: const RouteSettings(name: '/movie'),
          builder:(BuildContext context) {
            return new Theme(
              data: _kTheme.copyWith(
                platform: Theme.of(context).platform
              ),
              child: new MovieDetailsPage(painting)
            );
          }
        )
    );
  }
}