import 'package:flutter/material.dart';

class SelectedCountry extends StatelessWidget {
  SelectedCountry(this.country);
  final String country;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country),
      ),
    );
  }
}
