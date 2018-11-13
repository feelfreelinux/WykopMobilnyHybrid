import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EmbedWidget extends StatelessWidget {
  final Embed embed;
  EmbedWidget({this.embed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.0),
      child: CachedNetworkImage(
        placeholder: Image.memory(kTransparentImage),
        imageUrl: embed.preview,
        height: 200,
      ),
    );
  }
}
