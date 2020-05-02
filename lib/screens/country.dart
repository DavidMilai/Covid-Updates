import 'package:flutter/material.dart';
import 'compareCountries.dart';
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
  bool isSearching = true;
  bool filter = true;
  String selectedCountry;
  int result = 0;
  List countries = [];
  @override
  void initState() {
    super.initState();
    getDetails = GetDetails(details: widget.countryCases);
    updateCountries();
  }

  void updateCountries() {
    for (int x = 0; x < getDetails.getTotalCountries(); x++) {
      countries.add(getDetails.getCountryName(x).toLowerCase());
    }
  }

  void searching(value) {
    if (countries.contains(value)) {
      result = countries.indexWhere((countries) => countries.contains(value));
      setState(() {
        filter = false;
      });
    } else {
      result = countries.indexWhere((countries) => countries.contains(value));
      if (result >= 0 && result < countries.length) {
        setState(() {
          filter = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? Text('Cases per Country')
            : TextField(
                autofocus: true,
                onChanged: (value) {
                  searching(value.toLowerCase());
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Search for a country',
                ),
              ),
        leading: isSearching ? null : Row(),
        actions: <Widget>[
          IconButton(
              icon: isSearching ? Icon(Icons.search) : Icon(Icons.close),
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                  filter = true;
                });
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0Xefe3ff),
        child: Icon(
          Icons.compare_arrows,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CompareCountries(
                countries: countries,
                data: widget.countryCases,
              ),
            ),
          );
        },
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Expanded(
              child: filter
                  ? ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: getDetails.getTotalCountries(),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectedCountry(
                                  index: index,
                                  allData: widget.countryCases,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            child: ListTile(
                              leading: Image.network(
                                getDetails.getImage(index),
                                width: 100,
                              ),
                              title:
                                  Text('${getDetails.getCountryName(index)}'),
                              subtitle: Text(
                                  'Cases: ${getDetails.getCases(index)}\n'
                                  'Recovered: ${getDetails.getRecovered(index)}\n'
                                  'Death: ${getDetails.getDeaths(index)}'),
                              isThreeLine: true,
                            ),
                          ),
                        );
                      })
                  : GestureDetector(
                      onTap: () {
                        print(result);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectedCountry(
                              index: result,
                              allData: widget.countryCases,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        child: Card(
                          child: ListTile(
                            leading: Image.network(getDetails.getImage(result)),
                            title: Text('${getDetails.getCountryName(result)}'),
                            subtitle: Text(
                                'Cases: ${getDetails.getCases(result)}\n'
                                'Recovered: ${getDetails.getRecovered(result)}\n'
                                'Death: ${getDetails.getDeaths(result)}'),
                            isThreeLine: true,
                          ),
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
