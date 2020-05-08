import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'results.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CompareCountries extends StatefulWidget {
  final countries;
  final data;
  final latestData;
  CompareCountries(
      {@required this.countries,
      @required this.latestData,
      @required this.data});
  @override
  _CompareCountriesState createState() => _CompareCountriesState();
}

class _CompareCountriesState extends State<CompareCountries> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController controllerTwo = TextEditingController();
  final TextEditingController controllerThree = TextEditingController();
  final TextEditingController controllerFour = TextEditingController();

  bool countryOne = true;
  bool countryTwo = true;
  bool countryThree = true;
  bool countryFour = true;

  int resultOne, resultTwo, resultThree, resultFour;
  List countries;
  String selectedCountryOne,
      selectedCountryTwo,
      selectedCountryThree,
      selectedCountryFour;

  @override
  void initState() {
    super.initState();
    countries = widget.countries;
  }

  searching(value) {
    if (countries.contains(value)) {
      resultOne =
          countries.indexWhere((countries) => countries.contains(value));
      setState(() {
        countryOne = false;
      });
      return resultOne;
    } else {
      setState(() {
        countryOne = true;
      });
      Fluttertoast.showToast(
          msg: "Check your spellings",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compare Countries'),
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
            StaggeredTile.count(4, 2),
          ],
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            selectedCountryOne = value.toLowerCase();
                          },
                          controller: controller,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "Country Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(style: BorderStyle.solid),
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                        child: Text('Search'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 10,
                        color: Colors.grey,
                        onPressed: () {
                          controller.clear();
                          setState(() {
                            searching(selectedCountryOne);
                          });
                        },
                      ),
                      countryOne
                          ? Text('')
                          : Text(
                              selectedCountryOne.toUpperCase(),
                              textAlign: TextAlign.center,
                            ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            selectedCountryTwo = value.toLowerCase();
                          },
                          controller: controllerTwo,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "Country Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(style: BorderStyle.solid),
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                        child: Text('Search'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 10,
                        color: Colors.grey,
                        onPressed: () {
                          controllerTwo.clear();
                          setState(() {
                            searchingTwo(selectedCountryTwo);
                          });
                        },
                      ),
                      countryTwo
                          ? Text('')
                          : Text(
                              selectedCountryTwo.toUpperCase(),
                              textAlign: TextAlign.center,
                            ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            selectedCountryThree = value.toLowerCase();
                          },
                          controller: controllerThree,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "Country Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(style: BorderStyle.solid),
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                        child: Text('Search'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 10,
                        color: Colors.grey,
                        onPressed: () {
                          controllerThree.clear();
                          setState(() {
                            searchingThree(selectedCountryThree);
                          });
                        },
                      ),
                      countryThree
                          ? Text('')
                          : Text(
                              selectedCountryThree.toUpperCase(),
                              textAlign: TextAlign.center,
                            ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            selectedCountryFour = value.toLowerCase();
                          },
                          controller: controllerFour,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "Country Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(style: BorderStyle.solid),
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                        child: Text('Search'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 10,
                        color: Colors.grey,
                        onPressed: () {
                          controllerFour.clear();
                          setState(() {
                            searchingFour(selectedCountryFour);
                          });
                        },
                      ),
                      countryFour
                          ? Text('')
                          : Text(
                              selectedCountryFour.toUpperCase(),
                              textAlign: TextAlign.center,
                            ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 20,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultsPage(
                                        countryOne: resultOne,
                                        latestData: widget.latestData,
                                        countryTwo: resultTwo,
                                        countryThree: resultThree,
                                        countryFour: resultFour,
                                        data: widget.data,
                                      )));
                        },
                        color: Colors.lightBlue[200],
                        child: Text("Compare"),
                      )
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

  searchingTwo(value) {
    if (countries.contains(value)) {
      resultTwo =
          countries.indexWhere((countries) => countries.contains(value));
      setState(() {
        countryTwo = false;
      });
      return resultTwo;
    } else {
      setState(() {
        countryTwo = true;
      });
      Fluttertoast.showToast(
          msg: "Check your spellings",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  searchingThree(value) {
    if (countries.contains(value)) {
      resultThree =
          countries.indexWhere((countries) => countries.contains(value));
      setState(() {
        countryThree = false;
      });
      return resultThree;
    } else {
      setState(() {
        countryThree = true;
      });
      Fluttertoast.showToast(
          msg: "Check your spellings",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  searchingFour(value) {
    if (countries.contains(value)) {
      resultFour =
          countries.indexWhere((countries) => countries.contains(value));
      setState(() {
        countryFour = false;
      });
      return resultFour;
    } else {
      setState(() {
        countryFour = true;
      });
      Fluttertoast.showToast(
          msg: "Check your spellings",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
