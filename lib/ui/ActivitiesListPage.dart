import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadanie_flutter_softnauts/bloc/activities_bloc.dart';
import 'package:zadanie_flutter_softnauts/models/activity.dart';
import 'package:zadanie_flutter_softnauts/persistance/api_provider.dart';
import 'package:zadanie_flutter_softnauts/ui/DetailPage.dart';

class ActivitiesListPage extends StatefulWidget {
  @override
  _ActivitiesListPageState createState() => _ActivitiesListPageState();
}

class _ActivitiesListPageState extends State<ActivitiesListPage>
    with AutomaticKeepAliveClientMixin<ActivitiesListPage> {
  final _listBloc = ActivitiesBloc(ActivitiesDataSource());
  final _scrollController = ScrollController();
  TextEditingController editingController = TextEditingController();

  @override
  bool get wantKeepAlive => true;
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                _listBloc.getDataWithQuery(value);
              },
              controller: editingController,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Expanded(
            child: BlocBuilder(
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
                            : _buildDataListItem(
                                index + 1, state.results[index]);
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
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
