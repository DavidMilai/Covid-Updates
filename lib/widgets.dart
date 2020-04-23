import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(8.0),
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
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: ListTile(
          leading: image,
          title: bigText,
        ),
      ),
    );
  }
}
