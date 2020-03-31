// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exoplanet.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ExoplanetState> _$exoplanetStateSerializer =
    new _$ExoplanetStateSerializer();
Serializer<Planet> _$planetSerializer = new _$PlanetSerializer();

class _$ExoplanetStateSerializer
    implements StructuredSerializer<ExoplanetState> {
  @override
  final Iterable<Type> types = const [ExoplanetState, _$ExoplanetState];
  @override
  final String wireName = 'ExoplanetState';

  @override
  Iterable<Object> serialize(Serializers serializers, ExoplanetState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'results',
      serializers.serialize(object.results,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Planet)])),
    ];

    return result;
  }

  @override
  ExoplanetState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExoplanetStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Planet)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$PlanetSerializer implements StructuredSerializer<Planet> {
  @override
  final Iterable<Type> types = const [Planet, _$Planet];
  @override
  final String wireName = 'Planet';

  @override
  Iterable<Object> serialize(Serializers serializers, Planet object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Planet deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlanetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ExoplanetState extends ExoplanetState {
  @override
  final BuiltList<Planet> results;

  factory _$ExoplanetState([void Function(ExoplanetStateBuilder) updates]) =>
      (new ExoplanetStateBuilder()..update(updates)).build();

  _$ExoplanetState._({this.results}) : super._() {
    if (results == null) {
      throw new BuiltValueNullFieldError('ExoplanetState', 'results');
    }
  }

  @override
  ExoplanetState rebuild(void Function(ExoplanetStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExoplanetStateBuilder toBuilder() =>
      new ExoplanetStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExoplanetState && results == other.results;
  }

  @override
  int get hashCode {
    return $jf($jc(0, results.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ExoplanetState')
          ..add('results', results))
        .toString();
  }
}

class ExoplanetStateBuilder
    implements Builder<ExoplanetState, ExoplanetStateBuilder> {
  _$ExoplanetState _$v;

  ListBuilder<Planet> _results;
  ListBuilder<Planet> get results =>
      _$this._results ??= new ListBuilder<Planet>();
  set results(ListBuilder<Planet> results) => _$this._results = results;

  ExoplanetStateBuilder();

  ExoplanetStateBuilder get _$this {
    if (_$v != null) {
      _results = _$v.results?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExoplanetState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ExoplanetState;
  }

  @override
  void update(void Function(ExoplanetStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ExoplanetState build() {
    _$ExoplanetState _$result;
    try {
      _$result = _$v ?? new _$ExoplanetState._(results: results.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ExoplanetState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Planet extends Planet {
  @override
  final String name;

  factory _$Planet([void Function(PlanetBuilder) updates]) =>
      (new PlanetBuilder()..update(updates)).build();

  _$Planet._({this.name}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Planet', 'name');
    }
  }

  @override
  Planet rebuild(void Function(PlanetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlanetBuilder toBuilder() => new PlanetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Planet && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Planet')..add('name', name))
        .toString();
  }
}

class PlanetBuilder implements Builder<Planet, PlanetBuilder> {
  _$Planet _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  PlanetBuilder();

  PlanetBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Planet other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Planet;
  }

  @override
  void update(void Function(PlanetBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Planet build() {
    final _$result = _$v ?? new _$Planet._(name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
