import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/embed_full_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EmbedWidget extends StatefulWidget {
  EmbedWidget({this.embed});
  final Embed embed;

  _EmbedState createState() => _EmbedState();
}

class _EmbedState extends State<EmbedWidget> {
  double _imageFactor = 0.0;
  bool loading = true;
  bool resized = false;

  @override
  void initState() {
    super.initState();

    // First, fetch image size for sizedbox calculations
    CachedNetworkImageProvider(widget.embed.preview)
        .resolve(ImageConfiguration())
        .addListener((image, _) {
      this.setState(() {
        loading = false;
        _imageFactor = image.image.height / image.image.width;
        resized = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String heroTag = 'embedImage${widget.embed.hashCode}';
    return GestureDetector(
        // @TODO Handle NSFW
        onTap: () {
          if (!resized && !loading) {
            this.setState(() {
              resized = true;
            });
          } else {
            this.openFullscreen();
          }
        },
        child: Hero(
          tag: heroTag,
          child: Container(
            decoration: this.getDecoration(),
            constraints: this.currentConstraints(),
        )));
  }

  // If image size is already fetched, load whole image from cache
  BoxDecoration getDecoration() {
    if (loading) {
      return new BoxDecoration(); 
    }
    return new BoxDecoration(
      image: new DecorationImage(
        image: new CachedNetworkImageProvider(widget.embed.preview),
        alignment: FractionalOffset.topCenter,
        fit: BoxFit.fitWidth));
  } 

  // Returns size - default height for loading and unresized image, full for resized image
  BoxConstraints currentConstraints() {
    if (!loading) {
      var height = MediaQuery.of(context).size.width * this._imageFactor;

      if (!resized && height <= 300) {
        this.setState(() {
          resized = true;
        });
      } else if (resized) {
        return BoxConstraints.tight(Size.fromHeight(height));
      } else {
        return BoxConstraints.tight(Size.fromHeight(300));
      }
    }
    if (loading || !resized) {
      return BoxConstraints.tight(Size.fromHeight(300));
    } else {
      return BoxConstraints.tight(Size.fromHeight(
          MediaQuery.of(context).size.width * this._imageFactor));
    }
  }

  // Open fullscreen image viewer
  openFullscreen() {
    String heroTag = 'embedImage${widget.embed.hashCode}';

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EmbedFullScreen(
              heroTag: heroTag,
              imageProvider: CachedNetworkImageProvider(
                widget.embed.url,
              )),
        ));
  }
}
