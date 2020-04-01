import 'package:flutter/material.dart';
import 'package:zadanie_flutter_softnauts/models/activity.dart';

class DetailPage extends StatelessWidget {
  final Activity item;
  final int index;
  DetailPage({Key key, this.item, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(),
    );
  }
}
