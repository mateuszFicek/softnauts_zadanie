import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:zadanie_flutter_softnauts/bloc/activities_event.dart';
import 'package:zadanie_flutter_softnauts/models/activity.dart';
import 'package:zadanie_flutter_softnauts/persistance/api_provider.dart';

class ActivitiesBloc extends Bloc<ActivitiesEvent, ActivityState> {
  final ActivitiesDataSource _dataSource;

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
        dynamic activities;
        final nextPageItems = await _dataSource.getActivities();
      } catch (e) {}
    }

    if (event is FetchFirstPage) {
      try {
        print("FetchFirstActivities");
        final firstPageItems = await _dataSource.getActivities();
        yield ActivityState.success(firstPageItems);
      } catch (e) {}
    }
  }

  void dispose() {}
}
