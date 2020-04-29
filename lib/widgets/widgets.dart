import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import '../operations/networkGetters.dart';

class listTile extends StatelessWidget {
  listTile({
    @required this.smallText,
    @required this.bigText,
    @required this.image,
  });
  final Widget smallText;
  final Widget bigText;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 10,
        child: ListTile(
          leading: image,
          title: bigText,
          subtitle: smallText,
          isThreeLine: true,
        ),
      ),
    );
  }
}

class OneListTile extends StatelessWidget {
  OneListTile({
    @required this.bigText,
    @required this.image,
  });
  final Widget bigText;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Card(
        elevation: 10,
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: image,
          ),
          title: bigText,
        ),
      ),
    );
  }
}

class ContinentCard extends StatelessWidget {
  ContinentCard(
      {@required this.getDetails,
      @required this.africa,
      @required this.continent});

  final GetDetails getDetails;
  final int africa;
  final String continent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Card(
          elevation: 10,
          child: Column(
            children: <Widget>[
              Text(
                continent,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Cases: ${getDetails.getCases(africa)}\n'
                'New cases: ${getDetails.getLatestCases(africa)}\n'
                'Deaths: ${getDetails.getDeaths(africa)}\n'
                'New deaths: ${getDetails.getLatestDeaths(africa)}\n'
                'Recovered: ${getDetails.getRecovered(africa)}\n'
                'Active cases: ${getDetails.getActive(africa)}\n',
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Active\n ${getDetails.getPerActive(africa)}',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    'Recovered\n     ${getDetails.getPerRecovered(africa)}',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    'Dead\n  ${getDetails.getPerDeath(africa)}',
                    style: TextStyle(fontSize: 10),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  CountryCard({
    @required this.getDetails,
    this.countryNumber,
    @required this.scaler,
  });

  final GetDetails getDetails;
  final int countryNumber;
  final ScreenScaler scaler;

  bool checkNumber(int x) {
    if (x == null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Card(
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: checkNumber(countryNumber)
                ? Center(
                    child: Text(
                    "You can add another country here!",
                    textAlign: TextAlign.center,
                  ))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.network(
                        getDetails.getImage(countryNumber),
                        height: scaler.getHeight(11),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Cases: ${getDetails.getCases(countryNumber)}\n'
                        'New cases: ${getDetails.getLatestCases(countryNumber)}\n'
                        'Recovered: ${getDetails.getRecovered(countryNumber)}\n'
                        'Death: ${getDetails.getDeaths(countryNumber)}\n'
                        'New deaths: ${getDetails.getLatestDeaths(countryNumber)}\n'
                        'Active: ${getDetails.getActive(countryNumber)}\n'
                        'Tests: ${getDetails.getTests(countryNumber)}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: scaler.getTextSize(9.3),
                            wordSpacing: 3,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Active',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                '${getDetails.getPerActive(countryNumber)}',
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Recovered',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                '${getDetails.getPerRecovered(countryNumber)}',
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Dead',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                '${getDetails.getPerDeath(countryNumber)}',
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
