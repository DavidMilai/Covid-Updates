import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coronaupdate/widgets/widgets.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:coronaupdate/operations/networkGetters.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ResultsPage extends StatefulWidget {
  final int countryOne;
  final int countryTwo;
  final int countryThree;
  final int countryFour;
  final data;
  ResultsPage(
      {this.countryOne,
      this.countryTwo,
      this.countryThree,
      this.countryFour,
      @required this.data});
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  GetDetails getDetails;
  int countryOne;
  int countryTwo;
  int countryThree;
  int countryFour;

  @override
  void initState() {
    super.initState();
    getDetails = GetDetails(details: widget.data);
    countryOne = widget.countryOne;
    countryTwo = widget.countryTwo;
    countryThree = widget.countryThree;
    countryFour = widget.countryFour;
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected countries'),
      ),
      body: Container(
        child: StaggeredGridView.count(
          physics: BouncingScrollPhysics(),
          crossAxisCount: 4,
          mainAxisSpacing: 6,
          staggeredTiles: [
            StaggeredTile.count(2, 3),
            StaggeredTile.count(2, 3),
            StaggeredTile.count(2, 3),
            StaggeredTile.count(2, 3),
          ],
          children: <Widget>[
            CountryCard(
                getDetails: getDetails,
                countryNumber: countryOne,
                scaler: scaler),
            CountryCard(
                getDetails: getDetails,
                countryNumber: countryTwo,
                scaler: scaler),
            CountryCard(
                getDetails: getDetails,
                countryNumber: countryThree,
                scaler: scaler),
            CountryCard(
                getDetails: getDetails,
                countryNumber: countryFour,
                scaler: scaler),
          ],
        ),
      ),
    );
  }
}
