import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/models.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/keys.dart';
import 'dart:async';

class MediaScreen extends StatelessWidget {
  final Embed embed;
  MediaScreen({this.embed});

  // Matchers for spliting domains
  static const String GFYCAT_MATCHER = "gfycat.com";
  static const String COUB_MATCHER = "gfycat.com";
  static const String STREAMABLE_MATCHER = "gfycat.com";
  static const String YOUTUBE_MATCHER = "gfycat.com";
  static const String SIMPLE_YOUTUBE_MATCHER = "youtu.be";

  @override
  Widget build(BuildContext context) {
    if (embed.type == "image") {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(child: _handleImage()),
          Container(
            
            color: Colors.black.withOpacity(0.7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _drawToolbarIcon(Icons.share),
                _drawToolbarIcon(Icons.replay),
                _drawToolbarIcon(Icons.report),
                _drawToolbarIcon(Icons.save)
              ],
            ),
          )
        ],
      );
      _handleImage();
    } else {}
    return Container();
  }

  Widget _drawToolbarIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(icon),
    );
  }

  Widget _handleImage() {
    // Wykop API is really really wierd, .gifs are sent with .jpg extension. <insert shrug>
    var url =
        embed.isAnimated ? embed.url.replaceAll(".jpg", ".gif") : embed.url;
    return Container(
      child: PhotoView(
        backgroundColor: Colors.transparent,
        imageProvider: AdvancedNetworkImage(url),
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 1.1,
      ),
    );
  }

  Widget _handleVideo() {}

  void _handleGfycat() {}

  void _handleStreamable() {}

  void _handleCoub() {}

  void _matchService() {}
}
