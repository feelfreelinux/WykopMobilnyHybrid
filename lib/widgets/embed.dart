import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:owmflutter/models/models.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:provider/provider.dart';

class EmbedWidget extends StatefulWidget {
  final Embed embed;
  final double reducedWidth;
  final double borderRadius;
  final EdgeInsets padding;
  final bool isNsfwTag;

  EmbedWidget({
    this.embed,
    this.reducedWidth: 0.0,
    this.borderRadius: 0.0,
    this.padding,
    this.isNsfwTag = false,
  });

  _EmbedState createState() => _EmbedState();
}

class _EmbedState extends State<EmbedWidget> {
  bool resized = false;
  bool nsfw = false;

  @override
  void initState() {
    super.initState();
    nsfw = widget.embed.plus18 || widget.isNsfwTag;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: () {
          if (!resized) {
            if ((!nsfw && Provider.of<OWMSettings>(context).skipExpandImage) ||
                (nsfw &&
                    Provider.of<OWMSettings>(context).skipShowAdultImage)) {
              openFullscreen();
            } else {
              setState(() {
                resized = true;
                nsfw = false;
              });
            }
          } else if (nsfw) {
            if (Provider.of<OWMSettings>(context).skipShowAdultImage) {
              openFullscreen();
            } else {
              setState(() => nsfw = false);
            }
          } else {
            openFullscreen();
          }
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 2.0,
              bottom: 2.0,
              right: 0.0,
              left: 0.0,
              child: Center(child: CircularProgressIndicator()),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 100),
              decoration: _getDecoration(),
              constraints: _currentConstraints(),
              child: _drawFooter(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawFooter() {
    return Stack(
      children: [
        Positioned(
          child: Visibility(
            visible: nsfw && Provider.of<OWMSettings>(context).hideAdultImage,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Theme.of(context).accentColor.withOpacity(0.96),
                    Theme.of(context).accentColor
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  "NSFW",
                  style: TextStyle(
                      fontSize: (MediaQuery.of(context).size.width -
                              widget.reducedWidth) /
                          5.0,
                      letterSpacing: 6.0,
                      fontWeight: FontWeight.bold,
                      color: Utils.backgroundGreyOpacity(context)),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            opacity: !resized ? 1.0 : 0.0,
            duration: Duration(milliseconds: 100),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor.withOpacity(0.6),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(widget.borderRadius),
                  bottomRight: Radius.circular(widget.borderRadius),
                ),
              ),
              padding: EdgeInsets.all(4.0),
              child: Text(
                '••• kliknij, aby rozwinąć obrazek •••',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.title.copyWith(
                  fontSize: 11.0,
                  shadows: [
                    Shadow(
                      blurRadius: 1.5,
                      color: Theme.of(context).backgroundColor,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // If image size is already fetched, load whole image from cache
  BoxDecoration _getDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      boxShadow: [
        BoxShadow(color: Theme.of(context).iconTheme.color.withOpacity(0.15))
      ],
      image: DecorationImage(
        image: NetworkImage(Provider.of<OWMSettings>(context).highResImage
            ? widget.embed.preview.replaceAll(",w400.jpg", ",w600.jpg")
            : widget.embed.preview),
        alignment: FractionalOffset.topCenter,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  // Returns size - default height for loading and unresized image, full for resized image
  BoxConstraints _currentConstraints() {
    double maxHeight = MediaQuery.of(context).size.height / 2.0;
    double height =
        (MediaQuery.of(context).size.width - (widget.reducedWidth + 1.0)) *
            widget.embed.ratio;

    if ((!resized && height <= maxHeight) ||
        !Provider.of<OWMSettings>(context).shortLongPicture) {
      setState(() => resized = true);
    } else if (resized) {
      return BoxConstraints.tight(Size.fromHeight(height));
    } else {
      return BoxConstraints.tight(Size.fromHeight(maxHeight));
    }

    if (!resized) {
      return BoxConstraints.tight(Size.fromHeight(maxHeight));
    } else {
      return BoxConstraints.tight(Size.fromHeight(height));
    }
  }

  // Open fullscreen image viewer
  void openFullscreen() {
    Navigator.push(
        context, Utils.getPageSlideToUp(MediaScreen(embed: widget.embed)));
  }
}
