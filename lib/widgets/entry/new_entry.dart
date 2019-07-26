import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:owmflutter/model/model.dart';

class NewEntryWidget extends StatelessWidget {
  final bool ellipsize;
  final bool isClickable;
  NewEntryWidget({
    this.ellipsize,
    this.isClickable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<EntryModel>(
      builder: (context, model, _) => Padding(
        key: Key(model.id.toString()),
        padding: EdgeInsets.only(),
        child: Material(
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AuthorWidget(
                      author: model.author,
                      date: model.date,
                      fontSize: 14.0,
                      padding: EdgeInsets.only(top: 6.0, right: 4.0),
                    ),
                    _drawVoteButton(model),
                  ],
                ),
                _drawBody(context, model),
                _drawEmbed(model.embed),
                NewEntryFooterWidget(model, this.isClickable),
                Divider(height: 1.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawBody(BuildContext context, EntryModel model) {
    return SupaGestureDetector(
      onTap: isClickable
          ? () {
              Navigator.of(context).push(
                  Utils.getPageTransition(EntryScreen(model: model)));
            }
          : null,
      child: BodyWidget(
        body: model.body,
        ellipsize: ellipsize,
        padding: EdgeInsets.only(
          top: 8.0,
          left: 2.0,
          right: 2.0,
          bottom: 2.0,
        ),
      ),
    );
  }

  Widget _drawVoteButton(EntryModel entry) {
    return Padding(
      padding: EdgeInsets.only(top: 6.0),
      child: VoteButton(
          isSelected: entry.isVoted,
          count: entry.voteCount,
          onClicked: () {
            entry.voteToggle();
          },
        ),
      
    );
  }

  Widget _drawEmbed(Embed embed) {
    if (embed != null) {
      return Container(
        padding: EdgeInsets.only(top: 12.0, bottom: 2.0),
        child: EmbedWidget(
          embed: embed,
          borderRadius: 14.0,
          reducedWidth: 36.0,
        ),
      );
    } else {
      return Container();
    }
  }
}
