import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart' as Models;
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/navigator/navigator.dart';

class RelatedWidget extends StatelessWidget {
  final int id;
  RelatedWidget({this.id});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Models.Related>(
      key: Key(id.toString()),
      converter: (store) =>
          store.state.entitiesState.relatedLinks[id],
      builder: (context, related) {
        return Text(related.title);
      },
    );
  }
}
