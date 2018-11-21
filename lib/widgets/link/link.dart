import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';

class LinkWidget extends StatelessWidget {
  final int linkId;
  LinkWidget({this.linkId});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 0.0, bottom: 3.0),
        child: Material(
            color: Theme.of(context).cardColor,
            elevation: 0.0,
            child: StoreConnector<AppState, Link>(
                converter: (store) =>
                    store.state.entitiesState.links[linkId],
                builder: (context, link) {
                  return Column(
                    children: [Text(link.title)],
                  );
                })));
  }
}
