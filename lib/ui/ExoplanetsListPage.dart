import 'package:flutter/material.dart';
import 'package:zadanie_flutter_softnauts/bloc/bloc_provider.dart';
import 'package:zadanie_flutter_softnauts/bloc/exoplanets_bloc.dart';
import 'package:zadanie_flutter_softnauts/models/exoplanet.dart';

class ExoplanetsListPage extends StatefulWidget {
  @override
  _ExoplanetsListPageState createState() => _ExoplanetsListPageState();
}

class _ExoplanetsListPageState extends State<ExoplanetsListPage>
    with AutomaticKeepAliveClientMixin<ExoplanetsListPage> {
  final _scrollController = ScrollController();
  TextEditingController editingController = TextEditingController();
  final blocExoplanet = ExoplanetQueryBloc();

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
    return BlocProvider<ExoplanetQueryBloc>(
      bloc: blocExoplanet,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              blocExoplanet.search(value);
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
        Expanded(child: _buildExoplanetStreamBuilder(blocExoplanet))
      ]),
    );
  }

  Widget _buildExoplanetStreamBuilder(ExoplanetQueryBloc bloc) {
    return StreamBuilder(
      stream: bloc.exoplanetStream,
      builder: (context, snapshot) {
        final results = snapshot.data;
        if (results == null) {
          return Center(child: Text('Enter a restaurant name or cuisine type'));
        }

        if (results.isEmpty) {
          return Center(child: Text('No Results'));
        }

        return _buildExoplanetSearchResults(results);
      },
    );
  }

  Widget _buildExoplanetSearchResults(List<Planet> results) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: ListView.separated(
        itemCount: results.length,
        controller: _scrollController,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final restaurant = results[index];
          return ListTile(title: Text(restaurant.name.toString()));
        },
      ),
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      blocExoplanet.submitQuery();
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
