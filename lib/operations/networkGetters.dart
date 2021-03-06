import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class GetDetails {
  var details;
  GetDetails({@required this.details});
  final format = NumberFormat("#,###,###,###");

  int getTotalCountries() {
    return details.length;
  }

  getImage(int x) {
    return details[x]['countryInfo']['flag'];
  }

  String getTests(int x) {
    return format.format(details[x]['tests']);
  }

  String getCritical(int x) {
    return format.format(details[x]['critical']);
  }

  String getCountryName(int x) {
    return details[x]['country'];
  }

  String getCountryFlag(int x) {
    return details[x]['country'];
  }

  String searchCountry(String s, int x) {
    return details[x][s];
  }

  String getCases(int number) {
    return format.format(details[number]['cases']);
  }

  String getLatestCases(int number) {
    return format.format(details[number]['todayCases']);
  }

  String getDeaths(int number) {
    return format.format(details[number]['deaths']);
  }

  String getLatestDeaths(int number) {
    return format.format(details[number]['todayDeaths']);
  }

  String getRecovered(int number) {
    return format.format(details[number]['recovered']);
  }

  String getActive(int number) {
    return format.format(details[number]['active']);
  }

  String getPerDeath(int number) {
    double per;
    per = ((details[number]['deaths']) / (details[number]['cases'])) * 100;
    return '${per.round()}%';
  }

  String getPerRecovered(int number) {
    double per;
    per = ((details[number]['recovered']) / (details[number]['cases'])) * 100;
    return '${per.round()}%';
  }

  String getPerActive(int number) {
    double per;
    per = ((details[number]['active']) / (details[number]['cases'])) * 100;
    return '${per.round()}%';
  }
}
