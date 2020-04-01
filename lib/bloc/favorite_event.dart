import 'package:zadanie_flutter_softnauts/models/activity.dart';

abstract class FavoriteEvent {}

class AddNewActivity extends FavoriteEvent {
  final Activity activity;
  AddNewActivity(this.activity);
}

class DeleteActivity extends FavoriteEvent {
  final Activity activity;
  DeleteActivity(this.activity);
}
