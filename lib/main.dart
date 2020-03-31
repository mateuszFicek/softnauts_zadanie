import 'package:flutter/material.dart';
import 'package:zadanie_flutter_softnauts/models/exoplanet.dart';
import 'package:zadanie_flutter_softnauts/persistance/api_provider.dart';
import 'package:zadanie_flutter_softnauts/ui/ExoplanetsListPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 3;
  bool isLoaded = false;
  List<Planet> _planets = [];

  @override
  void initState() {
    super.initState();
    // getExoplanet().then((planets) {
    //   setState(() {
    //     _planets = planets;
    //     isLoaded = true;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExoplanetsListaPage(),
    );
  }
}
