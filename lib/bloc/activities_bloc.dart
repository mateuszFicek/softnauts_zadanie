import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:zadanie_flutter_softnauts/bloc/activities_event.dart';
import 'package:zadanie_flutter_softnauts/models/activity.dart';
import 'package:zadanie_flutter_softnauts/persistance/api_provider.dart';

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

  @override
  Stream<ActivityState> mapEventToState(ActivitiesEvent event) async* {
    if (event is FetchNextPage) {
      try {
        print("FetchNext");
        dynamic activs;
        final nextPageItems = await _dataSource.getActivities();
        if (activities.length > 0) {
          print(activities.length);
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
        print("FetchFirstActivities");
        final firstPageItems = await _dataSource.getActivities();
        activities = firstPageItems;
        yield ActivityState.success(firstPageItems);
      } catch (e) {}
    }
  }

  void dispose() {}
}
