import 'home.dart';
import 'package:flutter/material.dart';
import 'networkOps.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getData() async {
    NetworkOperations netops = NetworkOperations(
        url: 'https://corona.lmao.ninja/v2/all?yesterday=false');
    var coronaCases = await netops.getData();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  coronaDetails: coronaCases,
                )));
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SpinKitPumpingHeart(
            color: Colors.white,
            size: 150.0,
          ),
        ),
      ),
    );
  }
}
