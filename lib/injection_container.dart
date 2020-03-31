import 'package:kiwi/kiwi.dart';
import 'package:zadanie_flutter_softnauts/persistance/api_provider.dart';

import 'bloc/exoplanets_bloc.dart';

void initKiwi() {
  Container().registerFactory((c) => ExoplanetDataSource());
  Container().registerFactory((c) => ExoplanetBloc(c.resolve()));
}
