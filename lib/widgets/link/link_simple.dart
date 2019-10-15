import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:owmflutter/model/link_model.dart';
import 'package:owmflutter/owm_glyphs.dart';
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          key: Key(model.id.toString()),
                          onTap: () => Navigator.push(
                              context,
                              Utils.getPageTransition(
                                  LinkScreen(model: model))),
                          child: _drawTitle(context, model.title),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 18.0),
                          height: 28.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      OwmGlyphs.ic_buttontoolbar_wykop,
                                      size: 18.0,
                                      color: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .color,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 6.0),
                                      child: Text(
                                        model.voteCount.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.0,
                                          color: Theme.of(context)
                                              .textTheme
                                              .caption
                                              .color,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.comment,
                                      size: 16.0,
                                      color: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .color,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 6.0),
                                      child: Text(
                                        model.commentsCount.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.0,
                                          color: Theme.of(context)
                                              .textTheme
                                              .caption
                                              .color,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
        width: 140,
        height: 100,
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

  Widget _drawTitle(BuildContext context, String title) {
    return OWMSettingListener(
      rebuildOnChange: (settings) => settings.hiddingLinkThumbStream,
      builder: (context, settings) => Container(
        padding: EdgeInsets.only(
          top: 8.0,
          right: settings.hiddingLinkThumb ? 0.0 : 18.0,
          bottom: 4.0,
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
}
