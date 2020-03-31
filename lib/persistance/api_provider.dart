import 'dart:convert';
import 'dart:async';
import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' as http;
import 'package:zadanie_flutter_softnauts/models/exoplanet.dart';
import 'package:zadanie_flutter_softnauts/models/serializers.dart';

class ExoplanetDataSource {
  static const int ITEMS_PER_PAGE = 20;
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
