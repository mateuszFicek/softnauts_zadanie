import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:zadanie_flutter_softnauts/bloc/exoplanets_event.dart';
import 'package:zadanie_flutter_softnauts/models/exoplanet.dart';
import 'package:zadanie_flutter_softnauts/persistance/api_provider.dart';

// BLoC class for managing Exoplanets list.
class ExoplanetBloc extends Bloc<ExoplanetsEvent, ExoplanetState> {
  final ExoplanetDataSource _dataSource;

  BuiltList<Planet> planets;

  ExoplanetBloc(this._dataSource);

  @override
  ExoplanetState get initialState => ExoplanetState.initial();

  void getNextListPage() {
    add(FetchNextPage());
  }

  void getFirstListPage() {
    add(FetchFirstPage());
  }

  void getDataWithQuery(String query) {
    add(Search(query));
  }

  // Mapping Events to State
  @override
  Stream<ExoplanetState> mapEventToState(ExoplanetsEvent event) async* {
    if (event is FetchNextPage) {
      try {
        dynamic plans;
        final nextPageItems = await _dataSource.getExoplanet();
        if (planets.length > 0) {
          plans = planets + nextPageItems;
        } else {
          plans = nextPageItems;
        }
        planets = plans;
        yield ExoplanetState.success(plans);
      } catch (e) {}
    }
    if (event is FetchFirstPage) {
      try {
        final firstPageItems = await _dataSource.getExoplanet();
        planets = firstPageItems;
        yield ExoplanetState.success(firstPageItems);
      } catch (e) {}
    }
    if (event is Search) {
      try {
        BuiltList<Planet> plan = await _getSearchResults(event.query);
        yield ExoplanetState.success(plan);
      } catch (e) {}
    }
  }

  // Function that returns List of Planets that match query.
  Future<BuiltList<Planet>> _getSearchResults(String query) async {
    List<Planet> searched = new List();
    for (var planet in planets) {
      if (planet.name.contains(query)) searched.add(planet);
    }
    BuiltList<Planet> searchedList = new BuiltList<Planet>(searched);
    return searchedList;
  }

  void dispose() {}
}
