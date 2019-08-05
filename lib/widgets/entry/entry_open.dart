import 'package:flutter/material.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:owmflutter/model/model.dart';

class EntryOpenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<EntryModel>(
      builder: (context, model, _) => Material(
        key: Key(model.id.toString()),
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _drawVotersList(context, model),
                    VoteButton(
                      fontSize: 17.0,
                      isSelected: model.isVoted,
                      count: model.voteCount,
                      onClicked: () {
                        model.voteToggle();
                        model.loadUpVoters();
                      },
                    ),
                  ],
                ),
              ),
              BodyWidget(
                textSize: 16,
                body: model.body,
                padding: EdgeInsets.only(
                    top: 8.0, left: 2.0, right: 2.0, bottom: 2.0),
              ),
              Visibility(
                visible: model.embed != null,
                child: EmbedWidget(
                  padding: EdgeInsets.only(top: 12.0, bottom: 2.0),
                  embed: model.embed,
                  borderRadius: 20.0,
                  reducedWidth: 36.0,
                ),
              ),
              EntryFooterWidget(model, false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawVotersList(BuildContext context, EntryModel model) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          Visibility(
            visible: model.upvoters.length == 0,
            child: Container(
              height: 34.5,
              alignment: Alignment.centerLeft,
              child: Text("Jeszcze nikt nie dał plusa"),
            ),
          ),
          ...List<int>.generate(
                  model.upvoters.length >= 6 ? 6 : model.upvoters.length,
                  (i) => i)
              .map((e) => e == 0
                  ? AvatarWidget(
                      author: model.upvoters[e].author,
                      size: 30.0,
                      genderVisibility: false,
                    )
                  : Positioned(
                      left: 26.0 * e.toDouble(),
                      child: AvatarWidget(
                        author: model.upvoters[e].author,
                        size: 30.0,
                        genderVisibility: false,
                      ),
                    ))
              .toList(),
          Visibility(
            visible: model.upvoters.length > 6,
            child: Positioned(
              left: 156.0,
              child: GestureDetector(
                //TODO: Voters list
                child: Container(
                  height: 34.5,
                  width: 34.5,
                  decoration: BoxDecoration(
                    color: Utils.backgroundGrey(context),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).backgroundColor,
                      width: 2.0,
                    ),
                  ),
                  child: Icon(
                    Icons.more_horiz,
                    size: 21.0,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
