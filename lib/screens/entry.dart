import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/models/models.dart';

class EntryScreen extends StatelessWidget {
  final int entryId;

  EntryScreen({Key key, @required this.entryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wpis'),
        ),
        body: Container(
            decoration:
                new BoxDecoration(color: Theme.of(context).backgroundColor),
            child: StoreConnector<AppState, Entry>(
                converter: (store) => store.state.mikroblogState.entries[entryId],
                onInit: (store) {
                  store.dispatch(LoadEntry(entryId: entryId));
                },
                builder: (context, state) {
                  return ListView.builder(
                        itemCount: state.comments.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return EntryWidget(ellipsize: false, entry: state);
                          } else {
                            return EntryCommentWidget(comment: state.comments[index-1]);
                          }
                        });
                  
                })));
              


  }
}
