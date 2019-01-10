import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/models.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:video_player/video_player.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/keys.dart';
import 'dart:async';

class MediaScreen extends StatelessWidget {
  VideoPlayerController _controller;
  final Embed embed;
  MediaScreen({this.embed});

  // Matchers for spliting domains
  static const String GFYCAT_MATCHER = "gfycat.com";
  static const String COUB_MATCHER = "coub.com";
  static const String STREAMABLE_MATCHER = "streamable.com";
  static const String YOUTUBE_MATCHER = "youtube.com";
  static const String SIMPLE_YOUTUBE_MATCHER = "youtu.be";

  @override
  Widget build(BuildContext context) {
    if (embed.type == "image") {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(child: _handleImage()),
          _renderImageControls(context),
        ],
      );
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
        maxScale: PhotoViewComputedScale.covered * 3,
      ),
    );
  }

  Widget _handleVideo(BuildContext context) {
    return FutureBuilder<String>(
        future: getMediaUrl(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (this._controller == null) {
              this._controller = VideoPlayerController.network(snapshot.data);
            }
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                    child: Container(
                        child: EmbedVideoPlayer(
                            url: snapshot.data, controller: this._controller))),
                _renderImageControls(context)
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Future<String> getMediaUrl() {
    if (embed.url.contains(GFYCAT_MATCHER)) {
      return api.embed.getGfycatUrl(embed.url);
    } else if (embed.url.contains(STREAMABLE_MATCHER)) {
      return api.embed.getStreamableUrl(embed.url);
    } else {
      return api.embed.getCoubUrl(embed.url);
    }
  }

  Widget _renderImageControls(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                embed.type != "image"
                    ? VideoControlsToolbar(controller: _controller)
                    : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _drawToolbarIcon(Icons.info, "Informacje", () {
                      showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return new Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new ListTile(
                                  leading: new Icon(Icons.videocam),
                                  title: new Text('Tutaj'),
                                ),
                                new ListTile(
                                  leading: new Icon(Icons.filter_vintage),
                                  title: new Text('Będą'),
                                ),
                                new ListTile(
                                  leading: new Icon(Icons.find_replace),
                                  title: new Text('Informacje o embedzie'),
                                ),
                              ],
                            );
                          });
                    }),
                    _drawToolbarIcon(Icons.insert_link, "Skopiuj link", () {}),
                    _drawToolbarIcon(Icons.save, "Zapisz obraz", () {}),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class EmbedVideoPlayer extends StatefulWidget {
  final String url;
  final VideoPlayerController controller;
  EmbedVideoPlayer({this.url, this.controller});

  _EmbedVideoPlayerState createState() => _EmbedVideoPlayerState();
}

class _EmbedVideoPlayerState extends State<EmbedVideoPlayer> {
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    widget.controller
      ..addListener(() {
        final bool isPlaying = widget.controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })
      ..initialize().then((_) {
        setState(() {});
        widget.controller.setLooping(true);
        widget.controller.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.controller.value.isPlaying) {
          widget.controller.pause();
        } else {
          widget.controller.play();
        }
      },
      child: Container(
        child: widget.controller.value.initialized
            ? Center(
                child: AspectRatio(
                aspectRatio: widget.controller.value.aspectRatio,
                child: VideoPlayer(widget.controller),
              ))
            : Container(),
      ),
    );
  }
}
