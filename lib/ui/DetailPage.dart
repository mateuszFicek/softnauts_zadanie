import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadanie_flutter_softnauts/bloc/favorite_bloc.dart';
import 'package:zadanie_flutter_softnauts/bloc/favorite_event.dart';
import 'package:zadanie_flutter_softnauts/models/activity.dart';

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
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  item.id != null
                      ? Text(
                          "ID : ${item.id.toString()}",
                          style: textStyle(),
                        )
                      : Container(),
                  item.creation_date != null
                      ? Text(
                          "Creation date: ${item.creation_date.toString()}",
                          style: textStyle(),
                        )
                      : Container(),
                  item.date != null
                      ? Text(
                          "Date: ${item.date.toString()}",
                          style: textStyle(),
                        )
                      : Container(),
                  item.title != ""
                      ? Text(
                          "Title : ${item.title.toString()}",
                          style: textStyle(),
                        )
                      : Container(),
                  item.content != ""
                      ? Text(
                          "Content : ${item.content.toString()}",
                          style: textStyle(),
                        )
                      : Container(),
                  item.label != ""
                      ? Text(
                          "Label : ${item.label.toString()}",
                          style: textStyle(),
                        )
                      : Container(),
                  item.profile != null
                      ? Text(
                          "Profile : ${item.profile.toString()}",
                          style: textStyle(),
                        )
                      : Container(),
                  item.satellite != null
                      ? Text(
                          "Satellite: ${item.satellite.toString()}",
                          style: textStyle(),
                        )
                      : Container(),
                  item.observing_site != null
                      ? Text(
                          "Item observing site: ${item.observing_site.toString()}",
                          style: textStyle(),
                        )
                      : Container(),
                  item.telescope != null
                      ? Text(
                          "Telescope: ${item.telescope.toString()}",
                          style: textStyle(),
                        )
                      : Container(),
                  item.instrument != null
                      ? Text(
                          "Instrument : ${item.instrument.toString()}",
                          style: textStyle(),
                        )
                      : Container(),
                  item.programme != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text(
                                "Programme:",
                                style: textStyle(),
                              ),
                              Text(
                                " -> Identifier: ${item.programme.identifier}",
                                style: textStyle(),
                              ),
                              Text(
                                " -> Investigators list: ${item.programme.investigators_list}",
                                style: textStyle(),
                              ),
                            ])
                      : Container(),
                  item.programme_type != ""
                      ? Text(
                          "Programme type : ${item.programme_type.toString()}",
                          style: textStyle(),
                        )
                      : Container(),
                  item.target_name != ""
                      ? Text(
                          "Target name : ${item.target_name.toString()}",
                          style: textStyle(),
                        )
                      : Container(),
                  item.coordinates != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text(
                                "Coordinates:",
                                style: textStyle(),
                              ),
                              Text(
                                " -> System: ${item.coordinates.system.toString()}",
                                style: textStyle(),
                              ),
                              Text(
                                " -> Right ascension: ${item.coordinates.right_ascension.toString()}",
                                style: textStyle(),
                              ),
                              Text(
                                " -> Right ascrension unit: ${item.coordinates.right_ascension_units.toString()}",
                                style: textStyle(),
                              ),
                              Text(
                                " -> Declination: ${item.coordinates.declination.toString()}",
                                style: textStyle(),
                              ),
                              Text(
                                " -> Declination units: ${item.coordinates.declination_units.toString()}",
                                style: textStyle(),
                              ),
                              Text(
                                " -> Epoch: ${item.coordinates.epoch.toString()}",
                                style: textStyle(),
                              ),
                            ])
                      : Container(),
                  item.organisation != null
                      ? Text(
                          "Organisation : ${item.organisation.toString()}",
                          style: textStyle(),
                        )
                      : Container(),
                  item.collaboration != null
                      ? Text(
                          "Collaboration : ${item.collaboration.toString()}",
                          style: textStyle(),
                        )
                      : Container(),
                ],
              ),
            ),
          );
        });
  }
}
