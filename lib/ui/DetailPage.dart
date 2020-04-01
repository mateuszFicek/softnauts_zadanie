import 'package:flutter/material.dart';
import 'package:zadanie_flutter_softnauts/models/activity.dart';

class DetailPage extends StatelessWidget {
  final Activity item;
  final int index;
  DetailPage({Key key, this.item, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.favorite_border), onPressed: null)
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          item.id != null ? Text("ID : ${item.id.toString()}") : Container(),
          item.creation_date != null
              ? Text("Creation date: ${item.creation_date.toString()}")
              : Container(),
          item.date != null
              ? Text("Date: ${item.date.toString()}")
              : Container(),
          item.title != ""
              ? Text("Title : ${item.title.toString()}")
              : Container(),
          item.content != null
              ? Text("Content : ${item.content.toString()}")
              : Container(),
          item.label != null
              ? Text("Label : ${item.label.toString()}")
              : Container(),
          item.profile != null
              ? Text("Profile : ${item.profile.toString()}")
              : Container(),
          item.satellite != null
              ? Text("Satellite: ${item.satellite.toString()}")
              : Container(),
          item.observing_site != null
              ? Text("Item observing site: ${item.observing_site.toString()}")
              : Container(),
          item.telescope != null
              ? Text("Telescope: ${item.telescope.toString()}")
              : Container(),
          item.instrument != null
              ? Text("Instrument : ${item.instrument.toString()}")
              : Container(),
          item.programme != null
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Programme:"),
                  Text("Identifier: ${item.programme.identifier}"),
                  Text(
                      "Investigators list: ${item.programme.investigators_list}"),
                ])
              : Container(),
          item.programme_type != ""
              ? Text("Programme type : ${item.programme_type.toString()}")
              : Container(),
          item.target_name != ""
              ? Text("Target name : ${item.target_name.toString()}")
              : Container(),
          item.coordinates != null
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Coordinates:"),
                  Text("System: ${item.coordinates.system.toString()}"),
                  Text(
                      "Right ascension: ${item.coordinates.right_ascension.toString()}"),
                  Text(
                      "Right ascrension unit: ${item.coordinates.right_ascension_units.toString()}"),
                  Text(
                      "Declination: ${item.coordinates.declination.toString()}"),
                  Text(
                      "Declination units: ${item.coordinates.declination_units.toString()}"),
                  Text("Epoch: ${item.coordinates.epoch.toString()}"),
                ])
              : Container(),
          item.organisation != null
              ? Text("Organisation : ${item.organisation.toString()}")
              : Container(),
          item.collaboration != null
              ? Text("Collaboration : ${item.collaboration.toString()}")
              : Container(),
        ],
      ),
    );
  }
}
