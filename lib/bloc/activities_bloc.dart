import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:zadanie_flutter_softnauts/bloc/activities_event.dart';
import 'package:zadanie_flutter_softnauts/models/activity.dart';
import 'package:zadanie_flutter_softnauts/persistance/api_provider.dart';

// BLoC class for managing Activities list.
class ActivitiesBloc extends Bloc<ActivitiesEvent, ActivityState> {
  final ActivitiesDataSource _dataSource;
  BuiltList<Activity> activities;

  ActivitiesBloc(this._dataSource);

  @override
  ActivityState get initialState => ActivityState.initial();

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
  Stream<ActivityState> mapEventToState(ActivitiesEvent event) async* {
    if (event is FetchNextPage) {
      try {
        dynamic activs;
        final nextPageItems = await _dataSource.getActivities();
        if (activities.length > 0) {
          activs = activities + nextPageItems;
        } else {
          activs = nextPageItems;
        }
        activities = activs;
        yield ActivityState.success(activs);
      } catch (e) {}
    }

    if (event is FetchFirstPage) {
      try {
        final firstPageItems = await _dataSource.getActivities();
        activities = firstPageItems;
        yield ActivityState.success(firstPageItems);
      } catch (e) {}
    }

    if (event is Search) {
      try {
        BuiltList<Activity> plan = await _getSearchResults(event.query);
        yield ActivityState.success(plan);
      } catch (e) {}
    }
  }

  // Function that returns List of Activities that match query.
  Future<BuiltList<Activity>> _getSearchResults(String query) async {
    List<Activity> searched = new List();
    for (var activity in activities) {
      if (activity.target_name.contains(query)) searched.add(activity);
    }
    BuiltList<Activity> searchedList = new BuiltList<Activity>(searched);
    return searchedList;
  }

  void dispose() {}
}
