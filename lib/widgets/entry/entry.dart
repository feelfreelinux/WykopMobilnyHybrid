import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';

class EntryWidget extends StatelessWidget {
  final int entryId;
  final bool ellipsize;
  EntryWidget({
    this.entryId,
    this.ellipsize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: Key(entryId.toString()),
      padding: EdgeInsets.only(
        bottom: 3.0,
      ),
      child: Material(
        color: Theme.of(context).cardColor,
        child: StoreConnector<AppState, Entry>(
          converter: (store) => store.state.entitiesState.entries[entryId],
          builder: (context, entry) {
            return Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AuthorWidget(
                      author: entry.author,
                      date: entry.date,
                      fontSize: 14.0,
                    ),
                    _drawVoteButton(entry),
                  ],
                ),
                _drawBody(entry),
                _drawEmbed(entry),
                EntryFooterWidget(entry),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _drawVoteButton(Entry entry) {
    return Padding(
      padding: EdgeInsets.only(
        right: 12.0,
      ),
      child: StoreConnector<AppState, VoidCallback>(
        converter: (state) => () => state.dispatch(voteEntry(entryId)),
        builder: (context, callback) => VoteButton(
              isSelected: entry.isVoted,
              count: entry.voteCount,
              onClicked: () {
                callback();
              },
            ),
      ),
    );
  }

  Widget _drawBody(Entry entry) {
    if (entry.body != null) {
      return BodyWidget(
        body: entry.body,
        ellipsize: ellipsize,
        padding: EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 12.0,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _drawEmbed(Entry entry) {
    if (entry.embed != null) {
      return Container(
        padding: EdgeInsets.only(
          top: 6.0,
        ),
        child: EmbedWidget(embed: entry.embed),
      );
    } else {
      return Container();
    }
  }
}
