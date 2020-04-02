import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadanie_flutter_softnauts/bloc/exoplanets_bloc.dart';
import 'package:zadanie_flutter_softnauts/models/exoplanet.dart';
import 'package:zadanie_flutter_softnauts/persistance/api_provider.dart';

class ExoplanetsListPage extends StatefulWidget {
  @override
  _ExoplanetsListPageState createState() => _ExoplanetsListPageState();
}

class _ExoplanetsListPageState extends State<ExoplanetsListPage>
    with AutomaticKeepAliveClientMixin<ExoplanetsListPage> {
  ExoplanetBloc _bloc;

  final _scrollController = ScrollController();
  TextEditingController editingController = TextEditingController();

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
    _bloc = BlocProvider.of<ExoplanetBloc>(context);

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
      _bloc.getNextListPage();
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
