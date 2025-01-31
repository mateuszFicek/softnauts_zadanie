import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadanie_flutter_softnauts/bloc/activities_bloc.dart';
import 'package:zadanie_flutter_softnauts/bloc/exoplanets_bloc.dart';
import 'package:zadanie_flutter_softnauts/persistance/api_provider.dart';
import 'package:zadanie_flutter_softnauts/ui/ActivitiesListPage.dart';
import 'package:zadanie_flutter_softnauts/ui/ExoplanetsListPage.dart';

void main() => runApp(MyApp());

// First page which has 2 tabs one for Exoplanets and the other for Activities.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Softnauts - zadanie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Zadanie'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// State of MyApp
class _MyHomePageState extends State<MyHomePage> {
  ExoplanetBloc _blocExo = ExoplanetBloc(ExoplanetDataSource());
  ActivitiesBloc _blockAct = ActivitiesBloc(ActivitiesDataSource());

  @override
  void initState() {
    super.initState();
    _blocExo.getFirstListPage();
    _blockAct.getFirstListPage();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Zadanie - Softnauts'),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text('Exoplanets'),
              ),
              Tab(
                child: Text('Activities'),
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          BlocProvider(
              builder: (context) => _blocExo, child: ExoplanetsListPage()),
          BlocProvider(
              builder: (context) => _blockAct, child: ActivitiesListPage()),
        ]),
      ),
    );
  }
}
