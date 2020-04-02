import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadanie_flutter_softnauts/bloc/favorite_bloc.dart';
import 'package:zadanie_flutter_softnauts/bloc/favorite_event.dart';
import 'package:zadanie_flutter_softnauts/models/activity.dart';
import 'package:zadanie_flutter_softnauts/models/serializers.dart';
import 'dart:convert';

class DetailPage extends StatelessWidget {
  final Activity item;
  final int index;
  final FavoriteBloc bloc;
  DetailPage({Key key, this.item, this.index, this.bloc}) : super(key: key);
  TextStyle textStyle() {
    return TextStyle(fontSize: 16);
  }

  @override
  Widget build(BuildContext context) {
    final x = serializers.serialize(item);
    final Map<String, dynamic> data = json.decode(json.encode(x));

    return StreamBuilder<Object>(
        stream: bloc.isFav,
        initialData: bloc.isFavoried,
        builder: (context, snapshot) {
          return Scaffold(
              floatingActionButton: IconButton(
                  icon: Icon(
                    snapshot.data == 0 ? Icons.favorite_border : Icons.favorite,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    bloc.isFavoriedEventSink.add(ToggleFavorite());
                  }),
              appBar: AppBar(
                title: Text(
                  "Details about ${item.target_name}",
                  overflow: TextOverflow.ellipsis,
                ),
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                      icon: Icon(
                        snapshot.data == 0
                            ? Icons.favorite_border
                            : Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        bloc.isFavoriedEventSink.add(ToggleFavorite());
                      })
                ],
              ),
              body: ListView.builder(
                  itemCount: data.keys.length,
                  itemBuilder: (context, index) {
                    String key = data.keys.elementAt(index);
                    if (data[key] == "") return Container();
                    if (key == "programme") {
                      final x = serializers.serialize(item.programme);
                      final Map<String, dynamic> data =
                          json.decode(json.encode(x));
                    }
                    if (key == "coordinates" && data[key] != null) {
                      final x = serializers.serialize(item.coordinates);
                      final Map<String, dynamic> data =
                          json.decode(json.encode(x));
                      return listView(data);
                    }
                    if (key == "programme" && data[key] != null) {
                      final x = serializers.serialize(item.programme);
                      final Map<String, dynamic> data =
                          json.decode(json.encode(x));
                      return listView(data);
                    }

                    if (key == "links") {
                      if (item.links.isEmpty) {
                        return Container();
                      }
                      final x = serializers.serialize(item.links);
                      final Map<String, dynamic> data =
                          json.decode(json.encode(x));
                      return listView(data);
                    }
                    return new Column(
                      children: <Widget>[
                        new ListTile(
                          title: new Text("$key"),
                          subtitle: new Text("${data[key]}"),
                        ),
                        new Divider(
                          height: 2.0,
                        ),
                      ],
                    );
                  }));
        });
  }

  Widget listView(dynamic data) {
    return Container(
        height: 300,
        child: ListView.builder(
            itemCount: data.keys.length,
            itemBuilder: (context, index) {
              String key = data.keys.elementAt(index);

              if (data[key] == "") {
                return Container();
              }
              if (key == "investigators") {
                return Container();
              }
              return new Column(
                children: <Widget>[
                  new ListTile(
                    title: new Text(
                      "$key",
                      style: textStyle(),
                    ),
                    subtitle: new Text(
                      "${data[key]}",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  new Divider(
                    height: 2.0,
                  ),
                ],
              );
            }));
  }
}
