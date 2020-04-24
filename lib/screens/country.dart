import 'package:flutter/material.dart';
import 'selectedcountry.dart';
import 'package:coronaupdate/operations/networkGetters.dart';

class Countries extends StatefulWidget {
  final countryCases;
  Countries({@required this.countryCases});

  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  GetDetails getDetails;
  @override
  void initState() {
    super.initState();
    getDetails = GetDetails(details: widget.countryCases);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cases per Continent'),
      ),
      body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: getDetails.getTotalCountries(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectedCountry(
                                      getDetails.getCountryName(index))));
                        },
                        child: Card(
                          child: ListTile(
                            leading: Image.network(getDetails.getImage(index)),
                            title: Text('${getDetails.getCountryName(index)}'),
                            subtitle: Text(
                                'Total cases: ${getDetails.getCases(index)}\n'
                                'New cases: ${getDetails.getLatestCases(index)}\n'
                                'Total deaths: ${getDetails.getDeaths(index)}\n'
                                //'New deaths: ${getDetails.getLatestDeaths(index)}\n'
                                //'Recoveries: ${getDetails.getRecovered(index)}\n'
                                // 'Active: ${getDetails.getActive(index)}\n'
                                ),
                            isThreeLine: true,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          )),
    );
  }
}
