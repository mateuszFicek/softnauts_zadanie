import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:zadanie_flutter_softnauts/bloc/bloc.dart';
import 'package:zadanie_flutter_softnauts/models/activity.dart';
import 'package:zadanie_flutter_softnauts/persistance/api_provider.dart';

class ActivityQueryBloc implements Bloc {
  final _controller = new BehaviorSubject<List<Activity>>();
  List<Activity> activs = [];
  List<Activity> searched = [];

  final _client = ActivitiesDataSource();
  Stream<List<Activity>> get locationStream => _controller;
  ActivityQueryBloc() {
    submitQuery();
  }

  void submitQuery() async {
    final results = await _client.getActivities();
    activs += results.toList();
    _controller.sink.add(activs);
  }

  void search(String query) {
    for (var activity in activs) {
      if (activity.target_name.contains(query)) {
        searched.add(activity);
      }
    }

    _controller.sink.add(searched);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
