import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/model/link_model.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/content_hidden.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:provider/provider.dart';
import 'vote_counter.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/screens/screens.dart';

class LinkWidget extends StatefulWidget {
  LinkWidget();

  _NewLinkWidgetState createState() => _NewLinkWidgetState();
}

class _NewLinkWidgetState extends State<LinkWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthStateModel>(
      builder: (context, authStateModel, _) => Consumer<LinkModel>(
        builder: (context, model, _) => !model.isExpanded
            ? ContentHiddenWidget(onTap: () => model.expand())
            : GestureDetector(
                onLongPress: () =>
                    _showActionsDialog(context, model, authStateModel),
                child: Container(
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? null
                          : 190,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8.0,
                        offset: Offset(0.0, 1.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(18),
                    color: Theme.of(context).backgroundColor,
                    border: Border.all(
                        color: Theme.of(context).dialogBackgroundColor),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
                  child: Material(
                    type: MaterialType.transparency,
                    key: Key(model.id.toString()),
                    color: Theme.of(context).cardColor,
                    child: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? _buildVerticalLayout(model)
                        : _buildHorizontalLayout(model),
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildVerticalLayout(LinkModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _drawPreview(model),
        Padding(
          padding: EdgeInsets.only(left: 12.0, right: 14.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: AuthorWidget(
                  author: model.author,
                  date: model.date,
                  fontSize: 15.0,
                  padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
                ),
              ),
              VoteCounterWidget(
                voteState: model.voteState,
                onTap: () {
                  if (model.voteState != LinkVoteState.NONE) {
                    model.voteRemove();
                  } else {
                    model.voteUp();
                  }
                },
                onLongPress: () {
                  if (model.voteState != LinkVoteState.NONE) {
                    model.voteRemove();
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => BuryReasonDialog(
                        callback: (reason) => model.voteDown(reason),
                      ),
                    );
                  }
                },
                count: model.voteCount,
                size: 48.0,
                isHot: model.isHot,
                padding: EdgeInsets.only(top: 12.0, bottom: 10.0),
              ),
            ],
          ),
        ),
        GestureDetector(
          key: Key(model.id.toString()),
          onTap: () => Navigator.push(
            context,
            Utils.getPageSlideToUp(LinkScreen(model: model)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _drawTitle(context, model.title),
                _drawDescription(model.description),
              ],
            ),
          ),
        ),
        LinkFooterWidget(
          model: model,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
        ),
      ],
    );
  }

  Widget _buildHorizontalLayout(LinkModel model) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _drawPreview(model),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 14.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: AuthorWidget(
                            author: model.author,
                            date: model.date,
                            fontSize: 15.0,
                            padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
                          ),
                        ),
                        VoteCounterWidget(
                          voteState: model.voteState,
                          onTap: () {
                            if (model.voteState != LinkVoteState.NONE) {
                              model.voteRemove();
                            } else {
                              model.voteUp();
                            }
                          },
                          onLongPress: () {
                            if (model.voteState != LinkVoteState.NONE) {
                              model.voteRemove();
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => BuryReasonDialog(
                                  callback: (reason) => model.voteDown(reason),
                                ),
                              );
                            }
                          },
                          count: model.voteCount,
                          size: 48.0,
                          isHot: model.isHot,
                          padding: EdgeInsets.only(top: 12.0, bottom: 10.0),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    key: Key(model.id.toString()),
                    onTap: () => Navigator.push(
                      context,
                      Utils.getPageSlideToUp(LinkScreen(model: model)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          _drawTitle(context, model.title),
                          _drawDescription(model.description),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              LinkFooterWidget(
                model: model,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _drawPreview(LinkModel model) {
    return Visibility(
      visible:
          !Provider.of<OWMSettings>(context, listen: false).hiddingLinkThumb,
      child: GestureDetector(
        onTap: () => Utils.launchURL(model.sourceUrl, context),
        child: Stack(
          children: [
            _drawImage(context, model.preview),
            _drawLinkFavicon(context, model.sourceUrl),
            Visibility(
              visible: model.voteState != LinkVoteState.NONE,
              child: Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
      ),
    );
  }

  Widget _drawImage(BuildContext context, String preview) {
    return SizedBox(
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width - 28.0
          : (MediaQuery.of(context).size.width / 2) - 28.0,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? 180
          : 188,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.0),
        child: Container(
          color: Colors.grey.withOpacity(0.15),
          child: Stack(
            children: <Widget>[
              Center(child: CircularProgressIndicator()),
              preview != null
                  ? FadeInImage.memoryNetwork(
                      image: Provider.of<OWMSettings>(context, listen: false)
                              .highResImageLink
                          ? preview
                          : preview.replaceAll(".jpg", ",w207h139.jpg"),
                      placeholder: kTransparentImage,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      fadeInDuration: Duration(milliseconds: 200),
                    )
                  : Image.asset(
                      Theme.of(context).brightness == Brightness.light
                          ? 'assets/no_picture.jpg'
                          : 'assets/no_picture_night.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
            ],
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
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(0.8),
          border: Border.all(color: Color(0x337f7f7f), width: 0.5),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                shape: BoxShape.circle,
              ),
              child: Image(
                image: AdvancedNetworkImage(
                    'http://s2.googleusercontent.com/s2/favicons?domain_url=$sourceUrl'),
                height: 10.0,
                width: 10.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                sourceUrl
                    .replaceAll('https://', '')
                    .replaceAll('http://', '')
                    .replaceAll('www.', '')
                    .split('/')[0],
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawTitle(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.0),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        maxLines:
            MediaQuery.of(context).orientation == Orientation.portrait ? 3 : 2,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _drawDescription(String description) {
    return Text(
      description,
      overflow: TextOverflow.ellipsis,
      maxLines:
          MediaQuery.of(context).orientation == Orientation.portrait ? 3 : 2,
      style: TextStyle(color: Theme.of(context).textTheme.caption.color),
    );
  }

  void _showActionsDialog(
    BuildContext contextmain,
    LinkModel model,
    AuthStateModel authStateModel,
  ) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: contextmain,
      builder: (BuildContext context) =>
          LinkToolbarWidget(contextmain, model, authStateModel),
    );
  }
}
