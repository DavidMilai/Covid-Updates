import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../operations/networkGetters.dart';
import '../widgets/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Continent extends StatefulWidget {
  final continentDetails;
  Continent({this.continentDetails});
  @override
  _ContinentState createState() => _ContinentState();
}

class _ContinentState extends State<Continent> {
  int africa = 4;
  int oceania = 5;
  int southAmerica = 3;
  int asia = 2;
  int europe = 0;
  int northAmerica = 1;
  GetDetails getDetails;

  final format = NumberFormat("#,###,###,###");

  @override
  void initState() {
    super.initState();
    getDetails = GetDetails(details: widget.continentDetails);
  }

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
            StaggeredTile.count(2, 2),
            StaggeredTile.count(2, 2),
          ],
          children: <Widget>[
            ContinentCard(
              continent: 'Africa',
              getDetails: getDetails,
              africa: africa,
            ),
            ContinentCard(
              continent: 'Asia',
              getDetails: getDetails,
              africa: asia,
            ),
            ContinentCard(
              continent: 'Europe',
              getDetails: getDetails,
              africa: europe,
            ),
            ContinentCard(
              continent: 'North America',
              getDetails: getDetails,
              africa: northAmerica,
            ),
            ContinentCard(
              continent: 'Oceania',
              getDetails: getDetails,
              africa: oceania,
            ),
            ContinentCard(
              continent: 'South America',
              getDetails: getDetails,
              africa: southAmerica,
            ),
          ],
        ),
      ),
    );
  }
}
