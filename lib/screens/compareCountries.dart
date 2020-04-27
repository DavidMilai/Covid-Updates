import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CompareCountries extends StatefulWidget {
  @override
  _CompareCountriesState createState() => _CompareCountriesState();
}

class _CompareCountriesState extends State<CompareCountries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cases per Continent'),
      ),
      body: Container(
        child: StaggeredGridView.count(
          physics: BouncingScrollPhysics(),
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          staggeredTiles: [
            StaggeredTile.count(2, 2),
            StaggeredTile.count(2, 2),
            StaggeredTile.count(2, 2),
            StaggeredTile.count(2, 2),
          ],
          children: <Widget>[],
        ),
      ),
    );
  }
}
