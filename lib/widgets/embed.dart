import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/embed_full_screen.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';

class EmbedWidget extends StatefulWidget {
  final Embed embed;
  final double reducedWidth;
  final double borderRadius;
  EmbedWidget({this.embed, this.reducedWidth: 0.0, this.borderRadius: 0.0});

  _EmbedState createState() => _EmbedState();
}

class _EmbedState extends State<EmbedWidget> {
  double _imageFactor = 0.0;
  bool loading = true;
  bool resized = false;
  var imageResolver;
  var imageSizeListener;

  @override
  void initState() {
    super.initState();
    imageSizeListener = (ImageInfo image, bool _) => updateImageSize(image);

    // First, fetch image size for sizedbox calculations
    imageResolver =
        AdvancedNetworkImage(widget.embed.preview, useDiskCache: true)
            .resolve(ImageConfiguration());
    imageResolver.addListener(this.imageSizeListener);
  }

  @override
  void dispose() {
    super.dispose();
    this.imageResolver.removeListener(this.imageSizeListener);
  }

  void updateImageSize(ImageInfo image) {
    setState(() {
      loading = false;
      _imageFactor = image.image.height / image.image.width;
      resized = false;
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
                child: _drawFooter())));
  }

  Widget _drawFooter() {
    if (!this.loading && !this.resized) {
      return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(child: Container()),
        Container(
            padding: EdgeInsets.all(2.6),
            color: Color(0xaaffffff),
            child: Text('••• pokaż cały obrazek •••',
                style: TextStyle(fontSize: 10.5), textAlign: TextAlign.center))
      ]);
    } else {
      return Container();
    }
  }

  // If image size is already fetched, load whole image from cache
  BoxDecoration getDecoration() {
    if (loading) {
      return BoxDecoration();
    }
    return BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        boxShadow: [BoxShadow(color: Color(0x33000000))],
        image: DecorationImage(
            image:
                AdvancedNetworkImage(widget.embed.preview, useDiskCache: true),
            alignment: FractionalOffset.topCenter,
            fit: BoxFit.fitWidth));
  }

  // Returns size - default height for loading and unresized image, full for resized image
  BoxConstraints currentConstraints() {
    if (!loading) {
      var height = (MediaQuery.of(context).size.width - widget.reducedWidth) *
          this._imageFactor;

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
          (MediaQuery.of(context).size.width - widget.reducedWidth) *
              this._imageFactor));
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
                imageProvider: AdvancedNetworkImage(widget.embed.url,
                    useDiskCache: true))));
  }
}
