import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:uuid/uuid.dart';
import 'package:owmflutter/owm_glyphs.dart';

class EntryScreen extends StatelessWidget {
  final int entryId;
  final String screenId = Uuid().v4();

  EntryScreen({Key key, @required this.entryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: AppBar(actions: <Widget>[
              IconButton(
                  icon: Icon(OwmGlyphs.ic_refresh),
                  onPressed: () {},
                  tooltip: "Odśwież")
            ], elevation: 1.5)),
        body: Container(
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: StoreConnector<AppState, List<int>>(
                converter: (store) =>
                    store.state.entryScreensState.states[screenId] != null
                        ? store.state.entryScreensState.states[screenId].ids
                        : [],
                onInit: (store) {
                  store.dispatch(loadEntry(screenId, entryId));
                },
                builder: (context, ids) {
                  return ListView.builder(
                      itemCount: ids.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return EntryWidget(
                              ellipsize: false, entryId: entryId);
                        } else {
                          return EntryCommentWidget(commentId: ids[index]);
                        }
                      });
                })));
  }
}
