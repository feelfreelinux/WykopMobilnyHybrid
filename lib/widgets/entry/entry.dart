import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';

class EntryWidget extends StatelessWidget {
  final int entryId;
  final bool ellipsize;
  EntryWidget({this.entryId, this.ellipsize});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 4.0),
        child: Material(
            color: Theme.of(context).cardColor,
            child: StoreConnector<AppState, Entry>(
                converter: (store) =>
                    store.state.entitiesState.entries[entryId],
                builder: (context, entry) {
                  return Column(children: _buildEntryBody(entry));
                })));
  }

  List<Widget> _buildEntryBody(Entry entry) {
    return [
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AuthorWidget(
                author: entry.author, date: entry.date, fontSize: 13.5),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: StoreConnector<AppState, VoidCallback>(
                  converter: (state) =>
                      () => state.dispatch(voteEntry(entryId)),
                  builder: (context, callback) => VoteButton(
                      isSelected: entry.isVoted,
                      count: entry.voteCount,
                      onClicked: () {
                        callback();
                      }),
                ))
          ]),
      BodyWidget(
        body: entry.body,
        ellipsize: ellipsize,
        padding: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 6.0),
      ),
      _drawEmbed(entry),
      EntryFooterWidget(entry: entry)
    ];
  }

  Widget _drawEmbed(Entry entry) {
    if (entry.embed != null) {
      return Container(
          padding: EdgeInsets.only(top: 6.0),
          child: EmbedWidget(embed: entry.embed));
    } else {
      return Container();
    }
  }
}
