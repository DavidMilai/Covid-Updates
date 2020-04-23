import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'loading.dart';
import 'package:coronaupdate/continents.dart';
import 'widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({this.coronaDetails});
  final coronaDetails;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String totalCases;
  String casesToday;
  String totalDeaths;
  String newDeaths;
  String totalRecovered;
  String active;
  double recoveredPer;
  double deadPer;
  double activePer;

  final format = NumberFormat("#,###,###,###");

  @override
  void initState() {
    super.initState();
    updateUI(widget.coronaDetails);
  }

  void updateUI(dynamic covid) {
    totalCases = format.format(covid['cases']);
    casesToday = format.format(covid['todayCases']);
    totalDeaths = format.format(covid['deaths']);
    newDeaths = format.format(covid['todayDeaths']);
    totalRecovered = format.format(covid['recovered']);
    active = format.format(covid['active']);
    recoveredPer = ((covid['recovered'] / covid['cases']) * 100);
    deadPer = ((covid['deaths'] / covid['cases']) * 100);
    activePer = ((covid['active'] / covid['cases']) * 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoadingScreen()));
              })
        ],
        title: Text('Corona Virus Updates'),
        leading: Container(),
      ),
      body: Container(
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 4,
          mainAxisSpacing: 2,
          staggeredTiles: [
            StaggeredTile.count(2, 2),
            StaggeredTile.count(2, 2),
            StaggeredTile.count(4, 1),
            StaggeredTile.count(4, 1),
            StaggeredTile.count(2, 1),
            StaggeredTile.count(2, 1),
            StaggeredTile.count(4, 1),
          ],
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Continent()));
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(child: Image.asset('assets/continents.png')),
                        Text(
                          'Continents',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: Image.asset(
                  'assets/names.jpg',
                ),
              ),
            ),
            listTile(
              smallText: Text('New global cases \n $casesToday '),
              bigText: Text('Global Cases $totalCases'),
              image: Image.asset('assets/world.png'),
            ),
            listTile(
              bigText: Text('Total Deaths $totalDeaths'),
              smallText: Text('New deaths \n $newDeaths '),
              image: Image.asset('assets/death.png'),
            ),
            OneListTile(
              bigText: Text('Recovered patients $totalRecovered'),
              image: Image.asset('assets/recovery.png'),
            ),
            OneListTile(
              bigText: Text('Active patients $active'),
              image: Image.asset('assets/active.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Active',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            '${activePer.round()}%',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Recovered',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            '${recoveredPer.round()}%',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Dead',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            '${deadPer.round()}%',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
