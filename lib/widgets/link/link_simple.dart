import 'dart:ui';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:owmflutter/api/resources/links.dart';
import 'package:owmflutter/model/link_model.dart';
import 'package:owmflutter/widgets/content_hidden.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:provider/provider.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/screens/screens.dart';

class LinkSimpleWidget extends StatefulWidget {
  LinkSimpleWidget();

  _LinkSimpleWidgetState createState() => _LinkSimpleWidgetState();
}

class _LinkSimpleWidgetState extends State<LinkSimpleWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LinkModel>(
      builder: (context, model, _) => Material(
        key: Key(model.id.toString()),
        color: Theme.of(context).backgroundColor,
        child: Stack(
          children: <Widget>[
            Dismissible(
              background: slideRightBackground(model),
              secondaryBackground: slideLeftBackground(model),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  model.voteState != LinkVoteState.NONE
                      ? model.voteRemove()
                      : model.voteUp();
                } else {
                  model.voteState != LinkVoteState.NONE
                      ? model.voteRemove()
                      : showDialog(
                          context: context,
                          builder: (context) => BuryReasonDialog(
                            callback: (reason) => model.voteDown(reason),
                          ),
                        );
                }
                return;
              },
              key: Key(model.id.toString()),
              child: Padding(
                padding: EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                child: !model.isExpanded
                    ? ContentHiddenWidget(onTap: () => model.expand())
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OWMSettingListener(
                            rebuildOnChange: (settings) =>
                                settings.hiddingLinkThumbStream,
                            builder: (context, settings) => Visibility(
                              visible: !settings.hiddingLinkThumb,
                              child: GestureDetector(
                                onTap: () =>
                                    Utils.launchURL(model.sourceUrl, context),
                                child: _drawImage(context, model),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              key: Key(model.id.toString()),
                              onTap: () => Navigator.push(
                                  context,
                                  Utils.getPageSlideToUp(
                                      LinkScreen(model: model))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  _drawTitle(context, model),
                                  _drawDescription(context, model),
                                  _drawFooter(context, model)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(color: Colors.transparent, width: 24.0),
                  Container(color: Colors.transparent, width: 24.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget slideRightBackground(LinkModel model) {
    return Container(
      color: model.voteState != LinkVoteState.NONE
          ? Color(0xff4383af)
          : Color(0xffc0392b),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 20.0),
            Icon(
              model.voteState != LinkVoteState.NONE
                  ? Icons.cancel
                  : CommunityMaterialIcons.arrow_down_circle,
              color: Colors.white,
            ),
            Text(
              model.voteState != LinkVoteState.NONE ? "  Anuluj" : "  Zakop",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget slideLeftBackground(LinkModel model) {
    return Container(
      color: model.voteState != LinkVoteState.NONE
          ? Color(0xff4383af)
          : Color(0xff3b915f),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              model.voteState != LinkVoteState.NONE
                  ? Icons.cancel
                  : CommunityMaterialIcons.arrow_up_circle,
              color: Colors.white,
            ),
            Text(
              model.voteState != LinkVoteState.NONE ? "  Anuluj" : "  Wykop",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(width: 20.0),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  Widget _drawImage(BuildContext context, LinkModel model) {
    return OWMSettingListener(
      rebuildOnChange: (settings) => settings.highResImageLinkStream,
      builder: (context, settings) => Stack(
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              boxShadow: [BoxShadow(color: Color(0x33000000))],
              image: DecorationImage(
                image: model.preview != null
                    ? AdvancedNetworkImage(
                        settings.highResImageLink
                            ? model.preview
                            : model.preview.replaceAll(".jpg", ",q150.jpg"),
                        useDiskCache: true,
                      )
                    : AssetImage(
                        Theme.of(context).brightness == Brightness.light
                            ? 'assets/no_picture.jpg'
                            : 'assets/no_picture_night.jpg',
                      ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Visibility(
            visible: model.voteState != LinkVoteState.NONE,
            child: Positioned(
              bottom: 0.0,
              right: 0.0,
              left: 0.0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 6.0),
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: model.voteState == LinkVoteState.DIGGED
                      ? Color(0xff3b915f)
                      : Color(0xffc0392b),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  model.voteState == LinkVoteState.DIGGED
                      ? "Wykopane"
                      : "Zakopane",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawTitle(BuildContext context, LinkModel model) {
    return OWMSettingListener(
      rebuildOnChange: (settings) => settings.hiddingLinkThumbStream,
      builder: (context, settings) => Container(
        padding: EdgeInsets.only(
          left: settings.hiddingLinkThumb ? 0.0 : 12.0,
          bottom: 3.0,
        ),
        child: Text(
          model.title,
          overflow: TextOverflow.ellipsis,
          maxLines: MediaQuery.of(context).orientation == Orientation.portrait
              ? 2
              : 1,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _drawDescription(BuildContext context, LinkModel model) {
    return OWMSettingListener(
      rebuildOnChange: (settings) => settings.hiddingLinkThumbStream,
      builder: (context, settings) => Container(
        padding: EdgeInsets.only(
          left: settings.hiddingLinkThumb ? 0.0 : 12.0,
          bottom: 5.0,
        ),
        child: Text(
          model.description,
          overflow: TextOverflow.ellipsis,
          maxLines: MediaQuery.of(context).orientation == Orientation.portrait
              ? 1
              : 2,
          style: TextStyle(
            fontSize: 14.0,
            color: Theme.of(context).textTheme.caption.color,
          ),
        ),
      ),
    );
  }

  Widget _drawFooter(BuildContext context, LinkModel model) {
    return OWMSettingListener(
      rebuildOnChange: (settings) => settings.hiddingLinkThumbStream,
      builder: (context, settings) => Container(
        padding: EdgeInsets.only(left: settings.hiddingLinkThumb ? 0.0 : 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Visibility(
              visible: model.voteState != LinkVoteState.NONE,
              child: Padding(
                padding: EdgeInsets.only(bottom: 2.0, right: 2.0),
                child: Icon(
                  model.voteState == LinkVoteState.DIGGED
                      ? CommunityMaterialIcons.arrow_up_circle
                      : CommunityMaterialIcons.arrow_down_circle,
                  size: 14.0,
                  color: model.voteState == LinkVoteState.DIGGED
                      ? Color(0xff3b915f)
                      : Color(0xffc0392b),
                ),
              ),
            ),
            Visibility(
              visible: model.isHot,
              child: Padding(
                padding: EdgeInsets.only(bottom: 2.0),
                child: Icon(
                  CommunityMaterialIcons.fire,
                  size: 14.0,
                  color: Colors.red,
                ),
              ),
            ),
            Flexible(
              child: Text(
                model.voteCount.toString() +
                    Utils.polishPlural(
                      count: model.commentsCount,
                      first: " wykop",
                      many: " wykopów",
                      other: " wykopy",
                    ) +
                    " • " +
                    model.commentsCount.toString() +
                    Utils.polishPlural(
                      count: model.commentsCount,
                      first: " komentarz",
                      many: " komentarzy",
                      other: " komentarze",
                    ) +
                    (MediaQuery.of(context).orientation == Orientation.portrait
                        ? ""
                        : " • " + Utils.getSimpleDate(model.date)),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.caption.color,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
