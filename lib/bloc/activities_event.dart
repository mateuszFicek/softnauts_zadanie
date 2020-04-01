abstract class ActivitiesEvent {}

class FetchNextPage extends ActivitiesEvent {}

class FetchFirstPage extends ActivitiesEvent {}

class Search extends ActivitiesEvent {
  final String query;
  Search(this.query);
}
