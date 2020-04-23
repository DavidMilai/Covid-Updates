import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Continent extends StatefulWidget {
  @override
  _ContinentState createState() => _ContinentState();
}

class _ContinentState extends State<Continent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Continent data'),
      ),
      body: Container(
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 4,
          mainAxisSpacing: 2,
          staggeredTiles: [
            StaggeredTile.count(4, 2),
            StaggeredTile.count(2, 3),
            StaggeredTile.count(2, 2),
            StaggeredTile.count(2, 1),
            StaggeredTile.count(2, 1),
            StaggeredTile.count(1, 1),
            StaggeredTile.count(1, 1),
          ],
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
