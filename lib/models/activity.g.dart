// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ActivityState> _$activityStateSerializer =
    new _$ActivityStateSerializer();
Serializer<Activity> _$activitySerializer = new _$ActivitySerializer();
Serializer<ActivityLink> _$activityLinkSerializer =
    new _$ActivityLinkSerializer();
Serializer<Programme> _$programmeSerializer = new _$ProgrammeSerializer();
Serializer<Person> _$personSerializer = new _$PersonSerializer();
Serializer<Coords> _$coordsSerializer = new _$CoordsSerializer();

class _$ActivityStateSerializer implements StructuredSerializer<ActivityState> {
  @override
  final Iterable<Type> types = const [ActivityState, _$ActivityState];
  @override
  final String wireName = 'ActivityState';

  @override
  Iterable<Object> serialize(Serializers serializers, ActivityState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'results',
      serializers.serialize(object.results,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Activity)])),
    ];

    return result;
  }

  @override
  ActivityState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActivityStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Activity)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$ActivitySerializer implements StructuredSerializer<Activity> {
  @override
  final Iterable<Type> types = const [Activity, _$Activity];
  @override
  final String wireName = 'Activity';

  @override
  Iterable<Object> serialize(Serializers serializers, Activity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'creation_date',
      serializers.serialize(object.creation_date,
          specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'content',
      serializers.serialize(object.content,
          specifiedType: const FullType(String)),
      'label',
      serializers.serialize(object.label,
          specifiedType: const FullType(String)),
      'profile',
      serializers.serialize(object.profile,
          specifiedType: const FullType(String)),
      'satellite',
      serializers.serialize(object.satellite,
          specifiedType: const FullType(String)),
    ];
    if (object.observing_site != null) {
      result
        ..add('observing_site')
        ..add(serializers.serialize(object.observing_site,
            specifiedType: const FullType(String)));
    }
    if (object.telescope != null) {
      result
        ..add('telescope')
        ..add(serializers.serialize(object.telescope,
            specifiedType: const FullType(String)));
    }
    if (object.instrument != null) {
      result
        ..add('instrument')
        ..add(serializers.serialize(object.instrument,
            specifiedType: const FullType(String)));
    }
    if (object.programme != null) {
      result
        ..add('programme')
        ..add(serializers.serialize(object.programme,
            specifiedType: const FullType(Programme)));
    }
    if (object.programme_type != null) {
      result
        ..add('programme_type')
        ..add(serializers.serialize(object.programme_type,
            specifiedType: const FullType(String)));
    }
    if (object.target_name != null) {
      result
        ..add('target_name')
        ..add(serializers.serialize(object.target_name,
            specifiedType: const FullType(String)));
    }
    if (object.coordinates != null) {
      result
        ..add('coordinates')
        ..add(serializers.serialize(object.coordinates,
            specifiedType: const FullType(Coords)));
    }
    if (object.organisation != null) {
      result
        ..add('organisation')
        ..add(serializers.serialize(object.organisation,
            specifiedType: const FullType(int)));
    }
    if (object.collaboration != null) {
      result
        ..add('collaboration')
        ..add(serializers.serialize(object.collaboration,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Activity deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActivityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'creation_date':
          result.creation_date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'label':
          result.label = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'profile':
          result.profile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'satellite':
          result.satellite = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'observing_site':
          result.observing_site = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'telescope':
          result.telescope = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'instrument':
          result.instrument = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'programme':
          result.programme.replace(serializers.deserialize(value,
              specifiedType: const FullType(Programme)) as Programme);
          break;
        case 'programme_type':
          result.programme_type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'target_name':
          result.target_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'coordinates':
          result.coordinates.replace(serializers.deserialize(value,
              specifiedType: const FullType(Coords)) as Coords);
          break;
        case 'organisation':
          result.organisation = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'collaboration':
          result.collaboration = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ActivityLinkSerializer implements StructuredSerializer<ActivityLink> {
  @override
  final Iterable<Type> types = const [ActivityLink, _$ActivityLink];
  @override
  final String wireName = 'ActivityLink';

  @override
  Iterable<Object> serialize(Serializers serializers, ActivityLink object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ActivityLink deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActivityLinkBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ProgrammeSerializer implements StructuredSerializer<Programme> {
  @override
  final Iterable<Type> types = const [Programme, _$Programme];
  @override
  final String wireName = 'Programme';

  @override
  Iterable<Object> serialize(Serializers serializers, Programme object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'identifier',
      serializers.serialize(object.identifier,
          specifiedType: const FullType(String)),
      'investigators_list',
      serializers.serialize(object.investigators_list,
          specifiedType: const FullType(String)),
      'investigators',
      serializers.serialize(object.investigators,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Person)])),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'abstract',
      serializers.serialize(object.abstr,
          specifiedType: const FullType(String)),
      'abstract_url',
      serializers.serialize(object.abstract_url,
          specifiedType: const FullType(String)),
      'full_details_url',
      serializers.serialize(object.full_details_url,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Programme deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProgrammeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'identifier':
          result.identifier = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'investigators_list':
          result.investigators_list = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'investigators':
          result.investigators.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Person)]))
              as BuiltList<Object>);
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'abstract':
          result.abstr = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'abstract_url':
          result.abstract_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'full_details_url':
          result.full_details_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PersonSerializer implements StructuredSerializer<Person> {
  @override
  final Iterable<Type> types = const [Person, _$Person];
  @override
  final String wireName = 'Person';

  @override
  Iterable<Object> serialize(Serializers serializers, Person object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'first_name',
      serializers.serialize(object.first_name,
          specifiedType: const FullType(String)),
      'middle_name',
      serializers.serialize(object.middle_name,
          specifiedType: const FullType(String)),
      'initials',
      serializers.serialize(object.initials,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'last_name',
      serializers.serialize(object.last_name,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Person deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PersonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'first_name':
          result.first_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'middle_name':
          result.middle_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'initials':
          result.initials.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'last_name':
          result.last_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CoordsSerializer implements StructuredSerializer<Coords> {
  @override
  final Iterable<Type> types = const [Coords, _$Coords];
  @override
  final String wireName = 'Coords';

  @override
  Iterable<Object> serialize(Serializers serializers, Coords object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'system',
      serializers.serialize(object.system,
          specifiedType: const FullType(String)),
      'right_ascension',
      serializers.serialize(object.right_ascension,
          specifiedType: const FullType(double)),
      'right_ascension_units',
      serializers.serialize(object.right_ascension_units,
          specifiedType: const FullType(String)),
      'declination_units',
      serializers.serialize(object.declination_units,
          specifiedType: const FullType(String)),
      'declination',
      serializers.serialize(object.declination,
          specifiedType: const FullType(double)),
      'epoch',
      serializers.serialize(object.epoch,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  Coords deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CoordsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'system':
          result.system = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'right_ascension':
          result.right_ascension = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'right_ascension_units':
          result.right_ascension_units = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'declination_units':
          result.declination_units = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'declination':
          result.declination = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'epoch':
          result.epoch = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$ActivityState extends ActivityState {
  @override
  final BuiltList<Activity> results;

  factory _$ActivityState([void Function(ActivityStateBuilder) updates]) =>
      (new ActivityStateBuilder()..update(updates)).build();

  _$ActivityState._({this.results}) : super._() {
    if (results == null) {
      throw new BuiltValueNullFieldError('ActivityState', 'results');
    }
  }

  @override
  ActivityState rebuild(void Function(ActivityStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActivityStateBuilder toBuilder() => new ActivityStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivityState && results == other.results;
  }

  @override
  int get hashCode {
    return $jf($jc(0, results.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ActivityState')
          ..add('results', results))
        .toString();
  }
}

class ActivityStateBuilder
    implements Builder<ActivityState, ActivityStateBuilder> {
  _$ActivityState _$v;

  ListBuilder<Activity> _results;
  ListBuilder<Activity> get results =>
      _$this._results ??= new ListBuilder<Activity>();
  set results(ListBuilder<Activity> results) => _$this._results = results;

  ActivityStateBuilder();

  ActivityStateBuilder get _$this {
    if (_$v != null) {
      _results = _$v.results?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActivityState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ActivityState;
  }

  @override
  void update(void Function(ActivityStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ActivityState build() {
    _$ActivityState _$result;
    try {
      _$result = _$v ?? new _$ActivityState._(results: results.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ActivityState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Activity extends Activity {
  @override
  final int id;
  @override
  final String creation_date;
  @override
  final String date;
  @override
  final String title;
  @override
  final String content;
  @override
  final String label;
  @override
  final String profile;
  @override
  final String satellite;
  @override
  final String observing_site;
  @override
  final String telescope;
  @override
  final String instrument;
  @override
  final Programme programme;
  @override
  final String programme_type;
  @override
  final String target_name;
  @override
  final Coords coordinates;
  @override
  final int organisation;
  @override
  final int collaboration;

  factory _$Activity([void Function(ActivityBuilder) updates]) =>
      (new ActivityBuilder()..update(updates)).build();

  _$Activity._(
      {this.id,
      this.creation_date,
      this.date,
      this.title,
      this.content,
      this.label,
      this.profile,
      this.satellite,
      this.observing_site,
      this.telescope,
      this.instrument,
      this.programme,
      this.programme_type,
      this.target_name,
      this.coordinates,
      this.organisation,
      this.collaboration})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Activity', 'id');
    }
    if (creation_date == null) {
      throw new BuiltValueNullFieldError('Activity', 'creation_date');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('Activity', 'date');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('Activity', 'title');
    }
    if (content == null) {
      throw new BuiltValueNullFieldError('Activity', 'content');
    }
    if (label == null) {
      throw new BuiltValueNullFieldError('Activity', 'label');
    }
    if (profile == null) {
      throw new BuiltValueNullFieldError('Activity', 'profile');
    }
    if (satellite == null) {
      throw new BuiltValueNullFieldError('Activity', 'satellite');
    }
  }

  @override
  Activity rebuild(void Function(ActivityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActivityBuilder toBuilder() => new ActivityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Activity &&
        id == other.id &&
        creation_date == other.creation_date &&
        date == other.date &&
        title == other.title &&
        content == other.content &&
        label == other.label &&
        profile == other.profile &&
        satellite == other.satellite &&
        observing_site == other.observing_site &&
        telescope == other.telescope &&
        instrument == other.instrument &&
        programme == other.programme &&
        programme_type == other.programme_type &&
        target_name == other.target_name &&
        coordinates == other.coordinates &&
        organisation == other.organisation &&
        collaboration == other.collaboration;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        0,
                                                                        id
                                                                            .hashCode),
                                                                    creation_date
                                                                        .hashCode),
                                                                date.hashCode),
                                                            title.hashCode),
                                                        content.hashCode),
                                                    label.hashCode),
                                                profile.hashCode),
                                            satellite.hashCode),
                                        observing_site.hashCode),
                                    telescope.hashCode),
                                instrument.hashCode),
                            programme.hashCode),
                        programme_type.hashCode),
                    target_name.hashCode),
                coordinates.hashCode),
            organisation.hashCode),
        collaboration.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Activity')
          ..add('id', id)
          ..add('creation_date', creation_date)
          ..add('date', date)
          ..add('title', title)
          ..add('content', content)
          ..add('label', label)
          ..add('profile', profile)
          ..add('satellite', satellite)
          ..add('observing_site', observing_site)
          ..add('telescope', telescope)
          ..add('instrument', instrument)
          ..add('programme', programme)
          ..add('programme_type', programme_type)
          ..add('target_name', target_name)
          ..add('coordinates', coordinates)
          ..add('organisation', organisation)
          ..add('collaboration', collaboration))
        .toString();
  }
}

class ActivityBuilder implements Builder<Activity, ActivityBuilder> {
  _$Activity _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _creation_date;
  String get creation_date => _$this._creation_date;
  set creation_date(String creation_date) =>
      _$this._creation_date = creation_date;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _content;
  String get content => _$this._content;
  set content(String content) => _$this._content = content;

  String _label;
  String get label => _$this._label;
  set label(String label) => _$this._label = label;

  String _profile;
  String get profile => _$this._profile;
  set profile(String profile) => _$this._profile = profile;

  String _satellite;
  String get satellite => _$this._satellite;
  set satellite(String satellite) => _$this._satellite = satellite;

  String _observing_site;
  String get observing_site => _$this._observing_site;
  set observing_site(String observing_site) =>
      _$this._observing_site = observing_site;

  String _telescope;
  String get telescope => _$this._telescope;
  set telescope(String telescope) => _$this._telescope = telescope;

  String _instrument;
  String get instrument => _$this._instrument;
  set instrument(String instrument) => _$this._instrument = instrument;

  ProgrammeBuilder _programme;
  ProgrammeBuilder get programme =>
      _$this._programme ??= new ProgrammeBuilder();
  set programme(ProgrammeBuilder programme) => _$this._programme = programme;

  String _programme_type;
  String get programme_type => _$this._programme_type;
  set programme_type(String programme_type) =>
      _$this._programme_type = programme_type;

  String _target_name;
  String get target_name => _$this._target_name;
  set target_name(String target_name) => _$this._target_name = target_name;

  CoordsBuilder _coordinates;
  CoordsBuilder get coordinates => _$this._coordinates ??= new CoordsBuilder();
  set coordinates(CoordsBuilder coordinates) =>
      _$this._coordinates = coordinates;

  int _organisation;
  int get organisation => _$this._organisation;
  set organisation(int organisation) => _$this._organisation = organisation;

  int _collaboration;
  int get collaboration => _$this._collaboration;
  set collaboration(int collaboration) => _$this._collaboration = collaboration;

  ActivityBuilder();

  ActivityBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _creation_date = _$v.creation_date;
      _date = _$v.date;
      _title = _$v.title;
      _content = _$v.content;
      _label = _$v.label;
      _profile = _$v.profile;
      _satellite = _$v.satellite;
      _observing_site = _$v.observing_site;
      _telescope = _$v.telescope;
      _instrument = _$v.instrument;
      _programme = _$v.programme?.toBuilder();
      _programme_type = _$v.programme_type;
      _target_name = _$v.target_name;
      _coordinates = _$v.coordinates?.toBuilder();
      _organisation = _$v.organisation;
      _collaboration = _$v.collaboration;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Activity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Activity;
  }

  @override
  void update(void Function(ActivityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Activity build() {
    _$Activity _$result;
    try {
      _$result = _$v ??
          new _$Activity._(
              id: id,
              creation_date: creation_date,
              date: date,
              title: title,
              content: content,
              label: label,
              profile: profile,
              satellite: satellite,
              observing_site: observing_site,
              telescope: telescope,
              instrument: instrument,
              programme: _programme?.build(),
              programme_type: programme_type,
              target_name: target_name,
              coordinates: _coordinates?.build(),
              organisation: organisation,
              collaboration: collaboration);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'programme';
        _programme?.build();

        _$failedField = 'coordinates';
        _coordinates?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Activity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ActivityLink extends ActivityLink {
  @override
  final String title;
  @override
  final String url;

  factory _$ActivityLink([void Function(ActivityLinkBuilder) updates]) =>
      (new ActivityLinkBuilder()..update(updates)).build();

  _$ActivityLink._({this.title, this.url}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('ActivityLink', 'title');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('ActivityLink', 'url');
    }
  }

  @override
  ActivityLink rebuild(void Function(ActivityLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActivityLinkBuilder toBuilder() => new ActivityLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivityLink && title == other.title && url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, title.hashCode), url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ActivityLink')
          ..add('title', title)
          ..add('url', url))
        .toString();
  }
}

class ActivityLinkBuilder
    implements Builder<ActivityLink, ActivityLinkBuilder> {
  _$ActivityLink _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  ActivityLinkBuilder();

  ActivityLinkBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActivityLink other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ActivityLink;
  }

  @override
  void update(void Function(ActivityLinkBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ActivityLink build() {
    final _$result = _$v ?? new _$ActivityLink._(title: title, url: url);
    replace(_$result);
    return _$result;
  }
}

class _$Programme extends Programme {
  @override
  final String identifier;
  @override
  final String investigators_list;
  @override
  final BuiltList<Person> investigators;
  @override
  final String title;
  @override
  final String abstr;
  @override
  final String abstract_url;
  @override
  final String full_details_url;

  factory _$Programme([void Function(ProgrammeBuilder) updates]) =>
      (new ProgrammeBuilder()..update(updates)).build();

  _$Programme._(
      {this.identifier,
      this.investigators_list,
      this.investigators,
      this.title,
      this.abstr,
      this.abstract_url,
      this.full_details_url})
      : super._() {
    if (identifier == null) {
      throw new BuiltValueNullFieldError('Programme', 'identifier');
    }
    if (investigators_list == null) {
      throw new BuiltValueNullFieldError('Programme', 'investigators_list');
    }
    if (investigators == null) {
      throw new BuiltValueNullFieldError('Programme', 'investigators');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('Programme', 'title');
    }
    if (abstr == null) {
      throw new BuiltValueNullFieldError('Programme', 'abstr');
    }
    if (abstract_url == null) {
      throw new BuiltValueNullFieldError('Programme', 'abstract_url');
    }
    if (full_details_url == null) {
      throw new BuiltValueNullFieldError('Programme', 'full_details_url');
    }
  }

  @override
  Programme rebuild(void Function(ProgrammeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProgrammeBuilder toBuilder() => new ProgrammeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Programme &&
        identifier == other.identifier &&
        investigators_list == other.investigators_list &&
        investigators == other.investigators &&
        title == other.title &&
        abstr == other.abstr &&
        abstract_url == other.abstract_url &&
        full_details_url == other.full_details_url;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, identifier.hashCode),
                            investigators_list.hashCode),
                        investigators.hashCode),
                    title.hashCode),
                abstr.hashCode),
            abstract_url.hashCode),
        full_details_url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Programme')
          ..add('identifier', identifier)
          ..add('investigators_list', investigators_list)
          ..add('investigators', investigators)
          ..add('title', title)
          ..add('abstr', abstr)
          ..add('abstract_url', abstract_url)
          ..add('full_details_url', full_details_url))
        .toString();
  }
}

class ProgrammeBuilder implements Builder<Programme, ProgrammeBuilder> {
  _$Programme _$v;

  String _identifier;
  String get identifier => _$this._identifier;
  set identifier(String identifier) => _$this._identifier = identifier;

  String _investigators_list;
  String get investigators_list => _$this._investigators_list;
  set investigators_list(String investigators_list) =>
      _$this._investigators_list = investigators_list;

  ListBuilder<Person> _investigators;
  ListBuilder<Person> get investigators =>
      _$this._investigators ??= new ListBuilder<Person>();
  set investigators(ListBuilder<Person> investigators) =>
      _$this._investigators = investigators;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _abstr;
  String get abstr => _$this._abstr;
  set abstr(String abstr) => _$this._abstr = abstr;

  String _abstract_url;
  String get abstract_url => _$this._abstract_url;
  set abstract_url(String abstract_url) => _$this._abstract_url = abstract_url;

  String _full_details_url;
  String get full_details_url => _$this._full_details_url;
  set full_details_url(String full_details_url) =>
      _$this._full_details_url = full_details_url;

  ProgrammeBuilder();

  ProgrammeBuilder get _$this {
    if (_$v != null) {
      _identifier = _$v.identifier;
      _investigators_list = _$v.investigators_list;
      _investigators = _$v.investigators?.toBuilder();
      _title = _$v.title;
      _abstr = _$v.abstr;
      _abstract_url = _$v.abstract_url;
      _full_details_url = _$v.full_details_url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Programme other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Programme;
  }

  @override
  void update(void Function(ProgrammeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Programme build() {
    _$Programme _$result;
    try {
      _$result = _$v ??
          new _$Programme._(
              identifier: identifier,
              investigators_list: investigators_list,
              investigators: investigators.build(),
              title: title,
              abstr: abstr,
              abstract_url: abstract_url,
              full_details_url: full_details_url);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'investigators';
        investigators.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Programme', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Person extends Person {
  @override
  final String url;
  @override
  final String first_name;
  @override
  final String middle_name;
  @override
  final BuiltList<String> initials;
  @override
  final String last_name;

  factory _$Person([void Function(PersonBuilder) updates]) =>
      (new PersonBuilder()..update(updates)).build();

  _$Person._(
      {this.url,
      this.first_name,
      this.middle_name,
      this.initials,
      this.last_name})
      : super._() {
    if (url == null) {
      throw new BuiltValueNullFieldError('Person', 'url');
    }
    if (first_name == null) {
      throw new BuiltValueNullFieldError('Person', 'first_name');
    }
    if (middle_name == null) {
      throw new BuiltValueNullFieldError('Person', 'middle_name');
    }
    if (initials == null) {
      throw new BuiltValueNullFieldError('Person', 'initials');
    }
    if (last_name == null) {
      throw new BuiltValueNullFieldError('Person', 'last_name');
    }
  }

  @override
  Person rebuild(void Function(PersonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PersonBuilder toBuilder() => new PersonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Person &&
        url == other.url &&
        first_name == other.first_name &&
        middle_name == other.middle_name &&
        initials == other.initials &&
        last_name == other.last_name;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, url.hashCode), first_name.hashCode),
                middle_name.hashCode),
            initials.hashCode),
        last_name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Person')
          ..add('url', url)
          ..add('first_name', first_name)
          ..add('middle_name', middle_name)
          ..add('initials', initials)
          ..add('last_name', last_name))
        .toString();
  }
}

class PersonBuilder implements Builder<Person, PersonBuilder> {
  _$Person _$v;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _first_name;
  String get first_name => _$this._first_name;
  set first_name(String first_name) => _$this._first_name = first_name;

  String _middle_name;
  String get middle_name => _$this._middle_name;
  set middle_name(String middle_name) => _$this._middle_name = middle_name;

  ListBuilder<String> _initials;
  ListBuilder<String> get initials =>
      _$this._initials ??= new ListBuilder<String>();
  set initials(ListBuilder<String> initials) => _$this._initials = initials;

  String _last_name;
  String get last_name => _$this._last_name;
  set last_name(String last_name) => _$this._last_name = last_name;

  PersonBuilder();

  PersonBuilder get _$this {
    if (_$v != null) {
      _url = _$v.url;
      _first_name = _$v.first_name;
      _middle_name = _$v.middle_name;
      _initials = _$v.initials?.toBuilder();
      _last_name = _$v.last_name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Person other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Person;
  }

  @override
  void update(void Function(PersonBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Person build() {
    _$Person _$result;
    try {
      _$result = _$v ??
          new _$Person._(
              url: url,
              first_name: first_name,
              middle_name: middle_name,
              initials: initials.build(),
              last_name: last_name);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'initials';
        initials.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Person', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Coords extends Coords {
  @override
  final String system;
  @override
  final double right_ascension;
  @override
  final String right_ascension_units;
  @override
  final String declination_units;
  @override
  final double declination;
  @override
  final double epoch;

  factory _$Coords([void Function(CoordsBuilder) updates]) =>
      (new CoordsBuilder()..update(updates)).build();

  _$Coords._(
      {this.system,
      this.right_ascension,
      this.right_ascension_units,
      this.declination_units,
      this.declination,
      this.epoch})
      : super._() {
    if (system == null) {
      throw new BuiltValueNullFieldError('Coords', 'system');
    }
    if (right_ascension == null) {
      throw new BuiltValueNullFieldError('Coords', 'right_ascension');
    }
    if (right_ascension_units == null) {
      throw new BuiltValueNullFieldError('Coords', 'right_ascension_units');
    }
    if (declination_units == null) {
      throw new BuiltValueNullFieldError('Coords', 'declination_units');
    }
    if (declination == null) {
      throw new BuiltValueNullFieldError('Coords', 'declination');
    }
    if (epoch == null) {
      throw new BuiltValueNullFieldError('Coords', 'epoch');
    }
  }

  @override
  Coords rebuild(void Function(CoordsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CoordsBuilder toBuilder() => new CoordsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Coords &&
        system == other.system &&
        right_ascension == other.right_ascension &&
        right_ascension_units == other.right_ascension_units &&
        declination_units == other.declination_units &&
        declination == other.declination &&
        epoch == other.epoch;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, system.hashCode), right_ascension.hashCode),
                    right_ascension_units.hashCode),
                declination_units.hashCode),
            declination.hashCode),
        epoch.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Coords')
          ..add('system', system)
          ..add('right_ascension', right_ascension)
          ..add('right_ascension_units', right_ascension_units)
          ..add('declination_units', declination_units)
          ..add('declination', declination)
          ..add('epoch', epoch))
        .toString();
  }
}

class CoordsBuilder implements Builder<Coords, CoordsBuilder> {
  _$Coords _$v;

  String _system;
  String get system => _$this._system;
  set system(String system) => _$this._system = system;

  double _right_ascension;
  double get right_ascension => _$this._right_ascension;
  set right_ascension(double right_ascension) =>
      _$this._right_ascension = right_ascension;

  String _right_ascension_units;
  String get right_ascension_units => _$this._right_ascension_units;
  set right_ascension_units(String right_ascension_units) =>
      _$this._right_ascension_units = right_ascension_units;

  String _declination_units;
  String get declination_units => _$this._declination_units;
  set declination_units(String declination_units) =>
      _$this._declination_units = declination_units;

  double _declination;
  double get declination => _$this._declination;
  set declination(double declination) => _$this._declination = declination;

  double _epoch;
  double get epoch => _$this._epoch;
  set epoch(double epoch) => _$this._epoch = epoch;

  CoordsBuilder();

  CoordsBuilder get _$this {
    if (_$v != null) {
      _system = _$v.system;
      _right_ascension = _$v.right_ascension;
      _right_ascension_units = _$v.right_ascension_units;
      _declination_units = _$v.declination_units;
      _declination = _$v.declination;
      _epoch = _$v.epoch;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Coords other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Coords;
  }

  @override
  void update(void Function(CoordsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Coords build() {
    final _$result = _$v ??
        new _$Coords._(
            system: system,
            right_ascension: right_ascension,
            right_ascension_units: right_ascension_units,
            declination_units: declination_units,
            declination: declination,
            epoch: epoch);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
