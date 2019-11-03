import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:owmflutter/model/link_model.dart';
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
        child: Padding(
          padding: EdgeInsets.only(right: 18.0, left: 18.0, top: 16.0),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OWMSettingListener(
                    rebuildOnChange: (settings) =>
                        settings.hiddingLinkThumbStream,
                    builder: (context, settings) => Visibility(
                      visible: !settings.hiddingLinkThumb,
                      child: GestureDetector(
                        onTap: () => Utils.launchURL(model.sourceUrl),
                        child: _drawImage(context, model.preview),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      key: Key(model.id.toString()),
                      onTap: () => Navigator.push(context,
                          Utils.getPageTransition(LinkScreen(model: model))),
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
              DividerWidget(padding: EdgeInsets.only(top: 16.0)),
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
        width: 80,
        height: 80,
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

  Widget _drawTitle(BuildContext context, LinkModel model) {
    return OWMSettingListener(
      rebuildOnChange: (settings) => settings.hiddingLinkThumbStream,
      builder: (context, settings) => Container(
        padding: EdgeInsets.only(
          left: settings.hiddingLinkThumb ? 0.0 : 12.0,
          bottom: 4.0,
        ),
        child: Text(
          model.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
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
          bottom: 6.0,
        ),
        child: Text(
          model.description,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            fontSize: 13.0,
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
        padding: EdgeInsets.only(
          left: settings.hiddingLinkThumb ? 0.0 : 12.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Visibility(
              visible: model.isHot,
              child: Padding(
                padding: EdgeInsets.only(right: 4.0),
                child: Icon(
                  FontAwesomeIcons.hotjar,
                  size: 11.0,
                  color: Colors.red,
                ),
              ),
            ),
            Flexible(
              child: Text(
                model.voteCount.toString() +
                    " " +
                    Utils.polishPlural(
                      count: model.commentsCount,
                      first: "wykop",
                      many: "wykopów",
                      other: "wykopy",
                    ) +
                    " • " +
                    model.commentsCount.toString() +
                    " " +
                    Utils.polishPlural(
                      count: model.commentsCount,
                      first: "komentarz",
                      many: "komentarzy",
                      other: "komentarze",
                    ),
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
