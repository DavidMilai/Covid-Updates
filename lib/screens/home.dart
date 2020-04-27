import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'country.dart';
import '../loading.dart';
import 'package:coronaupdate/screens/continents.dart';
import '../widgets/widgets.dart';
import '../operations/networkOps.dart';

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
  var coronaContinentDetails;
  var coronaCountryDetails;

  final format = NumberFormat("#,###,###,###");

  getContinentData() async {
    NetworkOperations netops = NetworkOperations(
        url:
            'https://corona.lmao.ninja/v2/continents?yesterday=false&sort=cases');
    var coronaCases = await netops.getData();
    coronaContinentDetails = coronaCases;
  }

  getCountryData() async {
    final NetworkOperations netOps = NetworkOperations(
        url:
            'https://corona.lmao.ninja/v2/countries?yesterday=true&sort=cases');
    var coronaCases = await netOps.getData();
    coronaCountryDetails = coronaCases;
  }

  @override
  void initState() {
    super.initState();
    getContinentData();
    getCountryData();
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
              }),
        ],
        title: Text('Corona Virus Updates'),
        leading: Container(),
      ),
      body: Container(
        child: StaggeredGridView.count(
          physics: BouncingScrollPhysics(),
          crossAxisCount: 4,
          //crossAxisSpacing: 1,
          mainAxisSpacing: 2,
          staggeredTiles: [
            StaggeredTile.count(2, 2),
            StaggeredTile.count(2, 2),
            StaggeredTile.count(4, 1),
            StaggeredTile.count(4, 1),
            StaggeredTile.count(4, 1),
            StaggeredTile.count(4, 1),
            StaggeredTile.count(4, 1),
          ],
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Continent(
                              continentDetails: coronaContinentDetails,
                            )));
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
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Countries(
                              countryCases: coronaCountryDetails,
                            )));
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(child: Image.asset('assets/flag.png')),
                        Text(
                          'Country',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            listTile(
              smallText: Text('New global cases $casesToday'),
              bigText: Text('Global Cases $totalCases'),
              image: Image.asset('assets/world.png'),
            ),
            listTile(
              bigText: Text('Total Deaths $totalDeaths'),
              smallText: Text('New deaths $newDeaths '),
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
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            '${activePer.round()}%',
                            style: TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Recovered',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            '${recoveredPer.round()}%',
                            style: TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Dead',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            '${deadPer.round()}%',
                            style: TextStyle(fontSize: 25),
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
