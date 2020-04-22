import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  HomePage({this.coronaDetails});
  final coronaDetails;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int casesTotal;
  int casesToday;
  int deathsTotal;
  String total;

  final format = NumberFormat("#,###,###,###");

  @override
  void initState() {
    super.initState();
    updateUI(widget.coronaDetails);
  }

  void updateUI(dynamic covid) {
    casesTotal = covid['cases'];
    casesToday = covid['todayCases'];
    deathsTotal = covid['deaths'];
    total = format.format(casesTotal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Corona Virus Updates'),
        leading: Container(),
      ),
      body: Container(
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 2,
          staggeredTiles: [
            StaggeredTile.count(2, 2),
            StaggeredTile.count(2, 2),
            StaggeredTile.count(4, 1),
            StaggeredTile.count(4, 1),
            StaggeredTile.count(4, 1),
            StaggeredTile.count(4, 1),
          ],
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.group_work), onPressed: () {})
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: ListTile(
                  leading: Icon(Icons.add, size: 72),
                  title: Text('Total Cases $total'),
                  subtitle: Text('Total new cases \n $casesToday'),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                  isThreeLine: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: ListTile(
                  leading: Icon(Icons.add, size: 72),
                  title: Text('Total Cases 250000'),
                  subtitle: Text('Total new cases \n 50000'),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: ListTile(
                  leading: Icon(Icons.add, size: 72),
                  title: Text('Total Cases 250000'),
                  subtitle: Text('Total new cases \n 50000'),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: ListTile(
                  leading: Icon(Icons.add, size: 72),
                  title: Text('Total Cases 250000'),
                  subtitle: Text('Total new cases \n 50000'),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
