import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exoplanet.g.dart';

abstract class ExoplanetState
    implements Built<ExoplanetState, ExoplanetBuilder> {
  BuiltList<Planet> get results;

  ExoplanetState._();

  factory ExoplanetState([void Function(ExoplanetBuilder) updates]) =
      _$Exoplanet;
  static Serializer<ExoplanetState> get serializer => _$exoplanetSerializer;

  factory ExoplanetState.initial() {
    return ExoplanetState((b) => b..results.replace(BuiltList<Planet>()));
  }

  factory ExoplanetState.success(BuiltList<Planet> planets) {
    return ExoplanetState((b) => b..results.replace(planets));
  }
}

abstract class Planet implements Built<Planet, PlanetBuilder> {
  String get name;
  Planet._();
  factory Planet([void Function(PlanetBuilder) updates]) = _$Planet;
  static Serializer<Planet> get serializer => _$planetSerializer;
}
