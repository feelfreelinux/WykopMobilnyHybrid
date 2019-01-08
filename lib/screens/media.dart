import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/models.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:video_player/video_player.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/keys.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _drawToolbarIcon(Icons.replay, "Przeładuj", () {}),
                    _drawToolbarIcon(Icons.info, "Informacje", () {}),
                    _drawToolbarIcon(Icons.insert_link, "Skopiuj link", () {}),
                    _drawToolbarIcon(Icons.save, "Zapisz obraz", () {}),
                  ],
                ),
              ),
            ),
          )
        ],
      );
      _handleImage();
    } else {}
    return _handleVideo(context);
  }

  Widget _drawToolbarIcon(
      IconData icon, String tooltip, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Tooltip(
          child: InkWell(child: Icon(icon), onTap: onPressed),
          message: tooltip),
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

  Widget _handleVideo(BuildContext context) {
    if (embed.url.contains(GFYCAT_MATCHER)) {
      print('dddd');
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
              child: Container(
                  child: FutureBuilder<String>(
            future: _handleGfycat(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return EmbedVideoPlayer(url: snapshot.data);
              }
              return Container();
            },
          ))),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _drawToolbarIcon(Icons.replay, "Przeładuj", () {}),
                    _drawToolbarIcon(Icons.info, "Informacje", () {}),
                    _drawToolbarIcon(Icons.insert_link, "Skopiuj link", () {}),
                    _drawToolbarIcon(Icons.save, "Zapisz obraz", () {}),
                  ],
                ),
              ),
            ),
          )
        ],
      );
    }
    return Container();
  }

  Future<String> _handleGfycat() async {
    var gfycatItem = embed.url
        .replaceAll(".gif", "")
        .replaceAll(".mp4", "")
        .replaceAll(".webm", "")
        .replaceAll("-size_restricted", "")
        .split("/");

    var gfyId = gfycatItem[embed.url.endsWith('/')
        ? gfycatItem.length - 2
        : gfycatItem.length - 1];
    var data = await http.get('https://api.gfycat.com/v1/gfycats/' + gfyId);
    return json.decode(data.body)["gfyItem"]["mobileUrl"];
  }

  void _handleStreamable() {}

  void _handleCoub() {}

  void _matchService() {}
}

class EmbedVideoPlayer extends StatefulWidget {
  final String url;
  EmbedVideoPlayer({this.url});

  _EmbedVideoPlayerState createState() => _EmbedVideoPlayerState();
}

class _EmbedVideoPlayerState extends State<EmbedVideoPlayer> {
  VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.value.isPlaying) {
          _controller.pause();
        } else {
          _controller.play();
        }
      },
      child: Container(
        child: _controller.value.initialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
    );
  }
}
