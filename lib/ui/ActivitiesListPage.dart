import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadanie_flutter_softnauts/bloc/activities_bloc.dart';
import 'package:zadanie_flutter_softnauts/bloc/favorite_bloc.dart';
import 'package:zadanie_flutter_softnauts/bloc/favorite_event.dart';
import 'package:zadanie_flutter_softnauts/models/activity.dart';
import 'package:zadanie_flutter_softnauts/persistance/api_provider.dart';
import 'package:zadanie_flutter_softnauts/ui/DetailPage.dart';

class ActivitiesListPage extends StatefulWidget {
  @override
  _ActivitiesListPageState createState() => _ActivitiesListPageState();
}

class _ActivitiesListPageState extends State<ActivitiesListPage>
    with AutomaticKeepAliveClientMixin<ActivitiesListPage> {
  ActivitiesBloc _bloc;
  final _scrollController = ScrollController();
  TextEditingController editingController = TextEditingController();
  List<FavoriteBloc> _favBloc = [];

  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
    _favBloc.map((e) => e.dispose());
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ActivitiesBloc>(context);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                _bloc.getDataWithQuery(value);
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
              bloc: _bloc,
              builder: (context, ActivityState state) {
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
                        _favBloc.add(FavoriteBloc());
                        return index >= state.results.length
                            ? _buildLoaderListItem()
                            : _buildDataListItem(index, state.results[index]);
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
      _bloc.getNextListPage();
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
    return BlocProvider(
      builder: (context) => _favBloc[index],
      child: Card(
        margin: const EdgeInsets.all(4.0),
        child: InkWell(
          splashColor: Colors.red,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                        item: item, index: index, bloc: _favBloc[index])));
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                StreamBuilder<Object>(
                    stream: _favBloc[index].isFav,
                    initialData: 0,
                    builder: (context, snapshot) {
                      return IconButton(
                          icon: Icon(snapshot.data == 0
                              ? Icons.favorite_border
                              : Icons.favorite),
                          onPressed: () {
                            _favBloc[index]
                                .isFavoriedEventSink
                                .add(ToggleFavorite());
                          });
                    }),
                SizedBox(width: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    item.target_name != ""
                        ? item.target_name
                        : "No name given..",
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
      ),
    );
  }
}
