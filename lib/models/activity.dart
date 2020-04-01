import 'dart:collection';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity.g.dart';

abstract class ActivityState
    implements Built<ActivityState, ActivityStateBuilder> {
  BuiltList<Activity> get results;
  ActivityState._();
  factory ActivityState([void Function(ActivityStateBuilder) updates]) =
      _$ActivityState;

  static Serializer<ActivityState> get serializer => _$activityStateSerializer;

  factory ActivityState.initial() {
    return ActivityState((b) => b..results.replace(BuiltList<Activity>()));
  }

  factory ActivityState.success(BuiltList<Activity> activities) {
    return ActivityState((b) => b..results.replace(activities));
  }
}

abstract class Activity implements Built<Activity, ActivityBuilder> {
  int get id;
  String get creation_date;
  String get date;
  // BuiltList<ActivityLink> get links;
  String get title;
  String get content;
  String get label;
  String get profile;
  String get satellite;
  @nullable
  String get observing_site;
  @nullable
  String get telescope;
  @nullable
  String get instrument;
  @nullable
  Programme get programme;
  @nullable
  String get programme_type;
  @nullable
  String get target_name;
  @nullable
  Coords get coordinates;
  @nullable
  int get organisation;
  @nullable
  int get collaboration;

  Activity._();
  factory Activity([void Function(ActivityBuilder) updates]) = _$Activity;

  static Serializer<Activity> get serializer => _$activitySerializer;
}

abstract class ActivityLink
    implements Built<ActivityLink, ActivityLinkBuilder> {
  String get title;
  String get url;

  ActivityLink._();
  factory ActivityLink([void Function(ActivityLinkBuilder) updates]) =
      _$ActivityLink;

  static Serializer<ActivityLink> get serializer => _$activityLinkSerializer;
}

abstract class Programme implements Built<Programme, ProgrammeBuilder> {
  String get identifier;
  String get investigators_list;
  BuiltList<Person> get investigators;
  String get title;
  @BuiltValueField(wireName: 'abstract')
  String get abstr;
  String get abstract_url;
  String get full_details_url;

  Programme._();
  factory Programme([void Function(ProgrammeBuilder) updates]) = _$Programme;

  static Serializer<Programme> get serializer => _$programmeSerializer;
}

abstract class Person implements Built<Person, PersonBuilder> {
  String get url;
  String get first_name;
  String get middle_name;
  BuiltList<String> get initials;
  String get last_name;

  Person._();
  factory Person([void Function(PersonBuilder) updates]) = _$Person;

  static Serializer<Person> get serializer => _$personSerializer;
}

abstract class Coords implements Built<Coords, CoordsBuilder> {
  String get system;
  double get right_ascension;
  String get right_ascension_units;
  String get declination_units;
  double get declination;
  double get epoch;

  Coords._();
  factory Coords([void Function(CoordsBuilder) updates]) = _$Coords;

  static Serializer<Coords> get serializer => _$coordsSerializer;
}
