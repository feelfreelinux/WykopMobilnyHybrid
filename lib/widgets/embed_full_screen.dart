import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class EmbedFullScreen extends StatelessWidget {
  final ImageProvider imageProvider;
  final String heroTag;

  EmbedFullScreen({this.imageProvider, this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: PhotoView(
          imageProvider: imageProvider,
          heroTag: heroTag,
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 1.1,
        ));
  }
}
