import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/model/link_model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:provider/provider.dart';
import 'vote_counter.dart';
import 'votes_buttons.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/screens/screens.dart';

class NewLinkWidget extends StatefulWidget {
  NewLinkWidget();

  _NewLinkWidgetState createState() => _NewLinkWidgetState();
}

class _NewLinkWidgetState extends State<NewLinkWidget> {
  bool showButtonsState = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<LinkModel>(
      builder: (context, model, _) => Material(
        key: Key(model.id.toString()),
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AuthorWidget(
                          author: model.author,
                          date: model.date,
                          fontSize: 15.0,
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                        ),
                      ),
                      VoteCounterWidget(
                        voteState: model.voteState,
                        onTap: () {
                          if (model.voteState != LinkVoteState.NONE) {
                            model.voteRemove();
                            return;
                          }
                          setState(() {
                            showButtonsState = !showButtonsState;
                          });
                        },
                        count: model.voteCount,
                        size: 48.0,
                        isHot: model.isHot,
                        padding: EdgeInsets.symmetric(
                          vertical: 12.0,
                        ),
                      ),
                    ],
                  ),
                  VotesButtonsWidget(
                    showButtonsState: showButtonsState,
                    onTapUpVote: () {
                      model.voteUp();
                      setState(() => showButtonsState = false);
                    },
                    onTapDownVote: () {
                      showDialog(
                        context: context,
                        builder: (context) => BuryReasonDialog(
                          callback: (reason) => model.voteDown(reason),
                        ),
                      );

                      setState(() => showButtonsState = false);
                    },
                  ),
                ],
              ),
              OWMSettingListener(
                rebuildOnChange: (settings) => settings.hiddingLinkThumbStream,
                builder: (context, settings) => Visibility(
                  visible: !settings.hiddingLinkThumb,
                  child: GestureDetector(
                    onTap: () => Utils.launchURL(model.sourceUrl, context),
                    child: Stack(
                      children: [
                        _drawImage(context, model.preview),
                        _drawLinkFavicon(context, model.sourceUrl),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                key: Key(model.id.toString()),
                onTap: () {
                  Navigator.push(
                    context,
                    Utils.getPageTransition(
                      LinkScreen(
                        model: model,
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _drawTitle(context, model.title),
                    _drawDescription(model.description),
                  ],
                ),
              ),
              LinkFooterWidget(
                linkId: model.id,
                linkTitle: model.title,
                isClickable: false,
                commentsCount: model.commentsCount,
                isFavorite: model.isFavorite,
                onFavoriteClick: () => model.favoriteToggle(),
              ),
              DividerWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawImage(BuildContext context, String preview) {
    return OWMSettingListener(
      rebuildOnChange: (settings) => settings.highResImageLinkStream,
      builder: (context, settings) => Container(
        width: MediaQuery.of(context).size.width - 36.0,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [BoxShadow(color: Color(0x33000000))],
          image: DecorationImage(
            image: preview != null
                ? AdvancedNetworkImage(
                    settings.highResImageLink
                        ? preview
                        : preview.replaceAll(".jpg", ",q150.jpg"),
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
    );
  }

  Widget _drawLinkFavicon(BuildContext context, String sourceUrl) {
    return Positioned(
      right: 0,
      child: Container(
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(0.8),
          border: Border.all(
            color: Color(0x337f7f7f),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image(
                image: AdvancedNetworkImage(
                    'http://s2.googleusercontent.com/s2/favicons?domain_url=' +
                        sourceUrl),
                height: 10.0,
                width: 10.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
              child: Text(
                sourceUrl
                    .replaceAll('https://', '')
                    .replaceAll('http://', '')
                    .replaceAll('www.', '')
                    .split('/')[0],
                style: TextStyle(
                  fontSize: 11.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawTitle(BuildContext context, String title) {
    return OWMSettingListener(
      rebuildOnChange: (settings) => settings.hiddingLinkThumbStream,
      builder: (context, settings) => Container(
        padding: EdgeInsets.only(
          left: 2.0,
          top: settings.hiddingLinkThumb ? 0.0 : 12.0,
          right: 2.0,
          bottom: 6.0,
        ),
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _drawDescription(String description) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.0,
      ),
      child: Text(
        description,
        overflow: TextOverflow.ellipsis,
        maxLines: 4,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}
