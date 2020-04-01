import 'package:flutter/material.dart';
import 'package:zadanie_flutter_softnauts/bloc/activities_bloc.dart';
import 'package:zadanie_flutter_softnauts/bloc/bloc_provider.dart';
import 'package:zadanie_flutter_softnauts/models/activity.dart';
import 'package:zadanie_flutter_softnauts/ui/DetailPage.dart';

class ActivitiesListPage extends StatefulWidget {
  @override
  _ActivitiesListPageState createState() => _ActivitiesListPageState();
}

class _ActivitiesListPageState extends State<ActivitiesListPage>
    with AutomaticKeepAliveClientMixin<ActivitiesListPage> {
  final _scrollController = ScrollController();
  TextEditingController editingController = TextEditingController();
  final blocActivity = ActivityQueryBloc();

  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ActivityQueryBloc>(
      bloc: blocActivity,
      child: Container(child: _buildStreamBuilder(blocActivity)),
    );
  }

  Widget _buildStreamBuilder(ActivityQueryBloc bloc) {
    return StreamBuilder(
      stream: bloc.locationStream,
      builder: (context, snapshot) {
        final results = snapshot.data;
        if (results == null) {
          return Center(child: Text('Enter a restaurant name or cuisine type'));
        }

        if (results.isEmpty) {
          return Center(child: Text('No Results'));
        }

        return _buildSearchResults(results);
      },
    );
  }

  Widget _buildSearchResults(List<Activity> results) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: ListView.separated(
        itemCount: results.length,
        controller: _scrollController,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final activity = results[index];
          return _buildDataListItem(index, activity);
        },
      ),
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      blocActivity.submitQuery();
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
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: InkWell(
        splashColor: Colors.red,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(item: item, index: index)));
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
              SizedBox(width: 6),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  item.target_name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                SizedBox(height: 2),
                Text(item.creation_date,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
                Text(item.date,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey, fontSize: 16))
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
