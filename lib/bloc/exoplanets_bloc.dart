import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:zadanie_flutter_softnauts/bloc/exoplanets_event.dart';
import 'package:zadanie_flutter_softnauts/models/exoplanet.dart';
import 'package:zadanie_flutter_softnauts/persistance/api_provider.dart';

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

  @override
  Stream<ExoplanetState> mapEventToState(ExoplanetsEvent event) async* {
    if (event is FetchNextPage) {
      try {
        dynamic plans;
        print("FetchNext");
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
        print("FetchFirst");
        final firstPageItems = await _dataSource.getExoplanet();
        planets = firstPageItems;
        yield ExoplanetState.success(firstPageItems);
      } catch (e) {}
    }
  }

  void dispose() {}
}
