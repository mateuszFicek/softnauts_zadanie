import 'dart:convert';
import 'dart:async';
import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' as http;
import 'package:zadanie_flutter_softnauts/models/activity.dart';
import 'package:zadanie_flutter_softnauts/models/exoplanet.dart';
import 'package:zadanie_flutter_softnauts/models/serializers.dart';

class ExoplanetDataSource {
  int _shownPagesCount = 0;
  BuiltList<Planet> planets;

  Future<BuiltList<Planet>> getExoplanet() async {
    _shownPagesCount++;
    final _exoplanetUrl =
        "https://api.arcsecond.io/exoplanets/?page_size=20&page=$_shownPagesCount&format=json";
    final response = await http.get(Uri.parse(_exoplanetUrl));
    ExoplanetState exoplanet = serializers.deserializeWith(
        ExoplanetState.serializer, json.decode(response.body));
    return BuiltList.of(List.from(exoplanet.results));
  }
}

class ActivitiesDataSource {
  int _shownPagesCount = 0;
  BuiltList<Activity> activities;

  Future<BuiltList<Activity>> getActivities() async {
    _shownPagesCount++;
    final _activitiesUrl =
        "https://api.arcsecond.io/activities/?page_size=20&page=$_shownPagesCount&format=json";
    final response = await http.get(Uri.parse(_activitiesUrl));
    ActivityState activityState = serializers.deserializeWith(
        ActivityState.serializer, json.decode(response.body));
    return BuiltList.of(List.from(activityState.results));
  }
}
