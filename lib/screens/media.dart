import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/models.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:path/path.dart' as Path;
import 'package:mime/mime.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MediaModel extends ChangeNotifier {
  // Matchers for spliting domains
  static const String GFYCAT_MATCHER = "gfycat.com";
  static const String COUB_MATCHER = "coub.com";
  static const String STREAMABLE_MATCHER = "streamable.com";
  static const String YOUTUBE_MATCHER = "youtube.com";
  static const String SIMPLE_YOUTUBE_MATCHER = "youtu.be";

  bool _isImage = true;
  bool _isLoading = true;
  bool _isYoutube = false;
  bool _showIcons = false;
  bool get showIcons => _showIcons;
  bool get isImage => _isImage;
  bool get isYoutube => _isYoutube;
  bool get isLoading => _isLoading;
  String _videoUrl;

  VideoPlayerController _vpController;
  VideoPlayerController get videoPlayerController => _vpController;

  String get url => isImage
      ? embed.isAnimated ? embed.url.replaceAll(".jpg", ".gif") : embed.url
      : _videoUrl;

  final Embed embed;
  MediaModel({this.embed});

  void toogleIcons() {
    if (isYoutube) return;
    _showIcons = !_showIcons;
    notifyListeners();
  }

  void init() async {
    _isImage = embed.type == "image";
    notifyListeners();

    if (!_isImage) {
      if (embed.url.contains(YOUTUBE_MATCHER) ||
          embed.url.contains(SIMPLE_YOUTUBE_MATCHER)) {
        _videoUrl = embed.url;
        _isYoutube = true;
        _isLoading = false;
        _showIcons = false;
        notifyListeners();
        return;
      } else if (embed.url.contains(GFYCAT_MATCHER)) {
        _videoUrl = await api.embed.getGfycatUrl(embed.url);
      } else if (embed.url.contains(STREAMABLE_MATCHER)) {
        _videoUrl = await api.embed.getStreamableUrl(embed.url);
      }
      _vpController = VideoPlayerController.network(_videoUrl);
      await _vpController.initialize();
      _vpController.play();
    }

    _isLoading = false;
    notifyListeners();
  }

  String getYoutubeId() => YoutubePlayer.convertUrlToId(_videoUrl);
}

class MediaScreen extends StatefulWidget {
  final Embed embed;

  MediaScreen({this.embed});

  _MediaScreenState createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  MediaModel model;

  @override
  void initState() {
    model = MediaModel(embed: widget.embed)..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);

    return ChangeNotifierProvider<MediaModel>.value(
      value: model,
      child: MediaQuery(
        data: mqDataNew,
        child: Scaffold(
          body: Consumer<MediaModel>(
            builder: (context, mediaModel, _) => mediaModel.isLoading
                ? Center(child: CircularProgressIndicator())
                : GestureDetector(
                    onTap: () => model.toogleIcons(),
                    child: Stack(
                      children: <Widget>[
                        _drawBody(),
                        _drawStatusBar(),
                        _drawTopBar(),
                        _drawBottomBar(),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _drawBody() {
    return Positioned(
      top: MediaQuery.of(context).padding.top,
      bottom: 0,
      left: 0,
      right: 0,
      child: widget.embed.type == "image" ? _handleImage() : _handleVideo(),
    );
  }

  Widget _drawStatusBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).padding.top,
        color: Theme.of(context).backgroundColor.withOpacity(0.4),
      ),
    );
  }

  Widget _drawTopBar() {
    return Consumer<MediaModel>(
      builder: (context, mediaModel, _) => Positioned(
        top: 0,
        left: 0,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: mediaModel.showIcons ? 1.0 : 0.0,
          child: IgnorePointer(
            ignoring: !mediaModel.showIcons,
            child: Container(
              height: kToolbarHeight,
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              alignment: AlignmentDirectional.centerStart,
              padding: EdgeInsets.only(left: 8.0),
              child: Material(
                type: MaterialType.transparency,
                child: RoundIconButtonWidget(
                  icon: Icons.arrow_back,
                  iconColor: Theme.of(context).iconTheme.color,
                  roundColor:
                      Theme.of(context).backgroundColor.withOpacity(0.4),
                  onTap: () => Navigator.pop(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawBottomBar() {
    return Consumer<MediaModel>(
      builder: (context, mediaModel, _) => Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: mediaModel.showIcons ? 1.0 : 0.0,
          child: IgnorePointer(
            ignoring: !mediaModel.showIcons,
            child: Container(
              padding: EdgeInsets.only(bottom: 6.0, top: 12.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).backgroundColor.withOpacity(0.0),
                    Theme.of(context).backgroundColor.withOpacity(0.1)
                  ],
                ),
              ),
              child: Column(
                children: <Widget>[
                  !mediaModel.isImage && !mediaModel.isYoutube
                      ? VideoControlsToolbar(
                          controller: mediaModel.videoPlayerController)
                      : Container(),
                  Row(
                    children: <Widget>[
                      _drawToolbarIcon(Icons.share, 'Udostępnij', () async {
                        // @TODO: Move it somewhere
                        var request = await HttpClient()
                            .getUrl(Uri.parse(widget.embed.url));
                        var response = await request.close();
                        Uint8List bytes =
                            await consolidateHttpClientResponseBytes(response);
                        await Share.file(
                            'Udostępnij obrazek',
                            Path.basename(widget.embed.url),
                            bytes,
                            lookupMimeType(Path.basename(widget.embed.url)));
                      }),
                      _drawToolbarIcon(Icons.save, 'Zapisz', () async {
                        await ImageDownloader.downloadImage(widget.embed.url);
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Obrazek został zapisany")));
                      }),
                      Expanded(child: SizedBox()),
                      _drawToolbarIcon(
                        Icons.more_horiz,
                        'Więcej',
                        () => showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext contextsecond) {
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.open_in_new),
                                    title: Text('Otwórz w ...'),
                                    onTap: () {
                                      Navigator.pop(contextsecond);
                                      Utils.launchURL(widget.embed.url, context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.content_copy),
                                    title: Text('Skopiuj adres'),
                                    onTap: () {
                                      Navigator.pop(contextsecond);
                                      Utils.copyToClipboard(
                                          context, widget.embed.url);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.report),
                                    title: Text('Zgłoś'),
                                    onTap: () {
                                      Navigator.pop(
                                          contextsecond); //TODO: implement report image
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              content:
                                                  Text("Niezaimplementowane")));
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.info_outline),
                                    title: Text('Informacje'),
                                    onTap: () => _informationDialog(),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _informationDialog() {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (_) => GreatDialogWidget(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Informacje o pliku",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Źródło: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Flexible(
                    child: Text(
                      widget.embed.source != null
                          ? widget.embed.source
                          : "brak danych",
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Rozmiar: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Flexible(
                    child: Text(widget.embed.size != null
                        ? widget.embed.size
                        : "brak danych"),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Typ: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Flexible(
                    child: Text(widget.embed.type != null
                        ? widget.embed.type
                        : "brak danych"),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Proporcje: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Flexible(
                    child: Text(widget.embed.ratio != null
                        ? (widget.embed.ratio.toString() + ":1.0")
                        : "brak danych"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawToolbarIcon(IconData icon, String title, VoidCallback onPressed) {
    return Expanded(
      child: Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onPressed,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                Stack(
                  children: <Widget>[
                    Positioned(
                      left: 0.6,
                      top: 0.6,
                      child: Icon(
                        icon,
                        size: 28.0,
                        color:
                            Theme.of(context).backgroundColor.withOpacity(0.8),
                      ),
                    ),
                    Icon(
                      icon,
                      size: 28.0,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 0.6,
                        right: 0.0,
                        top: 0.6,
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11.0,
                            color: Theme.of(context)
                                .backgroundColor
                                .withOpacity(0.8),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 0.6),
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11.0,
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _handleImage() {
    return Consumer<MediaModel>(
      builder: (context, mediaModel, _) => PhotoView(
        backgroundDecoration: BoxDecoration(color: Colors.transparent),
        loadingChild: Container(
          height: MediaQuery.of(context).size.height,
          child: Center(child: CircularProgressIndicator()),
        ),
        imageProvider: AdvancedNetworkImage(mediaModel.url),
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 4.0,
      ),
    );
  }

  Widget _handleVideo() {
    try {
      return Consumer<MediaModel>(
        builder: (context, mediaModel, _) => mediaModel.isYoutube
            ? YoutubePlayer(
                context: context,
                initialVideoId: model.getYoutubeId(),
                flags: YoutubePlayerFlags(
                  autoPlay: true,
                  showVideoProgressIndicator: true,
                ),
                progressColors: ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
              )
            : EmbedVideoPlayer(
                url: mediaModel.url,
                controller: mediaModel.videoPlayerController),
      );
    } catch (e) {
      Navigator.pop(context);
      debugPrint("Launching url due to player exception " + e.toString());
      launchUrl(widget.embed.url, context: context);
    }

    return Center(child: CircularProgressIndicator());
  }

  @override
  void dispose() {
    super.dispose();
    model.videoPlayerController?.dispose();
  }
}

class EmbedVideoPlayer extends StatefulWidget {
  final String url;
  final VideoPlayerController controller;

  EmbedVideoPlayer({this.url, this.controller});

  _EmbedVideoPlayerState createState() => _EmbedVideoPlayerState();
}

class _EmbedVideoPlayerState extends State<EmbedVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.controller.value.initialized
          ? AspectRatio(
              aspectRatio: widget.controller.value.aspectRatio,
              child: VideoPlayer(widget.controller),
            )
          : CircularProgressIndicator(),
    );
  }
}
