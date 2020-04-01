import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:zadanie_flutter_softnauts/bloc/bloc.dart';
import 'package:zadanie_flutter_softnauts/models/activity.dart';
import 'package:zadanie_flutter_softnauts/models/exoplanet.dart';
import 'package:zadanie_flutter_softnauts/persistance/api_provider.dart';

class ExoplanetQueryBloc implements Bloc {
  final _controller = new BehaviorSubject<List<Planet>>();
  List<Planet> planets = [];
  List<Planet> searched = [];

  final _client = ExoplanetDataSource();
  Stream<List<Planet>> get exoplanetStream => _controller;
  ExoplanetQueryBloc() {
    submitQuery();
  }

  void submitQuery() async {
    final results = await _client.getExoplanet();
    planets += results.toList();
    _controller.sink.add(planets);
  }

  void search(String query) {
    for (var exoplanet in planets) {
      if (exoplanet.name.contains(query)) {
        searched.add(exoplanet);
      }
    }
    _controller.sink.close();
    _controller.sink.add(searched);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
