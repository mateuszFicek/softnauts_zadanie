import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadanie_flutter_softnauts/bloc/favorite_event.dart';
import 'package:zadanie_flutter_softnauts/models/activity.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, Activity> {
  List<Activity> favorites;
  FavoriteBloc();

  void addActivity(Activity activity) {
    add(AddNewActivity(activity));
  }

  void deleteActivity(Activity activity) {
    add(DeleteActivity(activity));
  }

  @override
  Activity get initialState => throw UnimplementedError();

  @override
  Stream<Activity> mapEventToState(FavoriteEvent event) {
    if (event is AddNewActivity) {
      favorites.add(event.activity);
    }
    if (event is DeleteActivity) {
      favorites.remove(event.activity);
    }
  }
}
