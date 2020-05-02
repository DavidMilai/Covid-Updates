import 'screens/home.dart';
import 'package:flutter/material.dart';
import 'operations/networkOps.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity/connectivity.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  getData() async {
    var net = await Connectivity().checkConnectivity();
    if (net == ConnectivityResult.none) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('No internet'),
              content: Text('You are not connected to a network'),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'))
              ],
            );
          });
    } else {
      NetworkOperations netops = NetworkOperations(
          url: 'https://corona.lmao.ninja/v2/all?yesterday=false');
      var coronaCases = await netops.getData();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            coronaDetails: coronaCases,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                getData();
              })
        ],
      ),
      body: Center(
        child: Container(
          child: SpinKitChasingDots(
            color: Colors.white,
            size: 120.0,
          ),
        ),
      ),
    );
  }
}
