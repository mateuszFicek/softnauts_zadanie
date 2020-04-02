import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:zadanie_flutter_softnauts/bloc/favorite_event.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, int> {
  int isFavoried = 0;
  @override
  int get initialState => 0;

  StreamController<int> _presetsController = new BehaviorSubject();
  StreamSink<int> get _inCounter => _presetsController.sink;

  Stream<int> get isFav => _presetsController.stream;

  final _isFavoriedEventController = StreamController<FavoriteEvent>();
  Sink<FavoriteEvent> get isFavoriedEventSink =>
      _isFavoriedEventController.sink;

  FavoriteBloc() {
    _isFavoriedEventController.stream.listen(mapEventToState);
  }

  void toggle() {
    add(ToggleFavorite());
  }

  @override
  Stream<int> mapEventToState(event) {
    if (event is ToggleFavorite) {
      try {
        if (isFavoried == 0) {
          isFavoried = 1;
        } else {
          isFavoried = 0;
        }
        _inCounter.add(isFavoried);
      } catch (e) {}
    }
  }

  void dispose() {
    _isFavoriedEventController.close();
    _presetsController.close();
  }
}
