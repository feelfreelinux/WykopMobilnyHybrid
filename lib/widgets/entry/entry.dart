import 'package:flutter/material.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:owmflutter/model/model.dart';

class NewEntryWidget extends StatelessWidget {
  final bool ellipsize;
  final bool isClickable;

  NewEntryWidget({this.ellipsize, this.isClickable = true});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: AuthorWidget(
                      author: model.author,
                      date: model.date,
                      fontSize: 15.0,
                      padding: EdgeInsets.only(top: 12.0, right: 4.0),
                    ),
                  ),
                  VoteButton(
                    margin: EdgeInsets.only(top: 10.0),
                    fontSize: 17.0,
                    isSelected: model.isVoted,
                    count: model.voteCount,
                    onClicked: () => model.voteToggle(),
                  ),
                ],
              ),
              SupaGestureDetector(
                onTap: isClickable
                    ? () => Navigator.of(context).push(
                        Utils.getPageTransition(EntryScreen(model: model)))
                    : null,
                onLongPress: () => showDialog(
                    context: context, builder: (_) => GreatDialogWidget()),
                child: OWMSettingListener(
                  rebuildOnChange: (settings) => settings.shortLongBodyStream,
                  builder: (context, settings) => BodyWidget(
                    body: model.body,
                    ellipsize: settings.shortLongBody,
                    textSize: 16.0,
                    padding: EdgeInsets.only(
                        top: 8.0, left: 2.0, right: 2.0, bottom: 2.0),
                  ),
                ),
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
              EntryFooterWidget(model, isClickable),
              DividerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
