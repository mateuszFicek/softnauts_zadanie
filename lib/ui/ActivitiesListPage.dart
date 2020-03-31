import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadanie_flutter_softnauts/bloc/activities_bloc.dart';
import 'package:zadanie_flutter_softnauts/models/activity.dart';
import 'package:zadanie_flutter_softnauts/persistance/api_provider.dart';

class ActivitiesListPage extends StatefulWidget {
  @override
  _ActivitiesListPageState createState() => _ActivitiesListPageState();
}

class _ActivitiesListPageState extends State<ActivitiesListPage> {
  final _listBloc = ActivitiesBloc(ActivitiesDataSource());
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
        builder: (context, ActivityState state) {
          if (state.results.length == 0) {
            print("Results are null");
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

  int calculateListItemCount(ActivityState state) {
    return state.results.length;
  }

  Widget _buildLoaderListItem() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildDataListItem(int index, Activity item) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        leading: IconButton(icon: Icon(Icons.favorite_border), onPressed: null),
        title: Text(
          item.target_name.toString(),
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        subtitle: Text("${item.creation_date}\n${item.date}"),
      ),
    );
  }
}
