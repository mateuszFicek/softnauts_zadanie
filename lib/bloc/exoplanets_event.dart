abstract class ExoplanetsEvent {}

class FetchNextPage extends ExoplanetsEvent {}

class FetchFirstPage extends ExoplanetsEvent {}

class Search extends ExoplanetsEvent {
  final String query;
  Search(this.query);
}
