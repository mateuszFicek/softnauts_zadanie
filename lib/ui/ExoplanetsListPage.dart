import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:zadanie_flutter_softnauts/bloc/exoplanets_bloc.dart';
import 'package:zadanie_flutter_softnauts/models/exoplanet.dart';
import 'package:zadanie_flutter_softnauts/persistance/api_provider.dart';

class ExoplanetsListaPage extends StatefulWidget {
  @override
  _ExoplanetsListaPageState createState() => _ExoplanetsListaPageState();
}

class _ExoplanetsListaPageState extends State<ExoplanetsListaPage> {
  final _listBloc = ExoplanetBloc(ExoplanetDataSource());
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _listBloc.getFirstListPage();
  }

  @override
  void dispose() {
    super.dispose();
    _listBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: _listBloc,
        builder: (context, ExoplanetState state) {
          if (state.results.length == 0) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return NotificationListener<ScrollNotification>(
              onNotification: _handleScrollNotification,
              child: ListView.builder(
                itemCount: calculateListItemCount(state),
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return index >= state.results.length
                      ? _buildLoaderListItem()
                      : _buildDataListItem(index + 1, state.results[index]);
                },
              ),
            );
          }
        },
      ),
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      _listBloc.getNextListPage();
    }

    return false;
  }

  int calculateListItemCount(ExoplanetState state) {
    return state.results.length;
  }

  Widget _buildLoaderListItem() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildDataListItem(int index, Planet item) {
    return ListTile(
      leading: Text(index.toString(),
          style: TextStyle(fontSize: 20, color: Colors.grey)),
      title: Text(
        item.name,
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }
}
