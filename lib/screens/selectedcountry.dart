import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coronaupdate/operations/networkGetters.dart';

class SelectedCountry extends StatefulWidget {
  SelectedCountry({
    this.allData,
    this.index,
  });
  final allData;
  final int index;
  @override
  _SelectedCountryState createState() => _SelectedCountryState();
}

class _SelectedCountryState extends State<SelectedCountry> {
  GetDetails getDetails;
  int number;
  @override
  void initState() {
    super.initState();
    number = widget.index;
    getDetails = GetDetails(details: widget.allData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getDetails.getCountryName(number)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: Image.network(
                getDetails.getImage(number),
                alignment: Alignment.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Tests done: ${getDetails.getTests(number)}\n'
                        'Total cases: ${getDetails.getCases(number)}\n'
                        'New cases: ${getDetails.getLatestCases(number)}\n'
                        'Total deaths: ${getDetails.getDeaths(number)}\n'
                        'New deaths: ${getDetails.getLatestDeaths(number)}\n'
                        'Recoveries: ${getDetails.getRecovered(number)}\n'
                        'Active: ${getDetails.getActive(number)}\n'
                        'Critical: ${getDetails.getCritical(number)}'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
