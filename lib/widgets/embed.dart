import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/embed_full_screen.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EmbedWidget extends StatelessWidget {
  final Embed embed;
  EmbedWidget({this.embed});

  @override
  Widget build(BuildContext context) {
    // Unique tag for each image
    String heroTag = 'embedImage${embed.hashCode}';

    return Padding(
      padding: EdgeInsets.only(top: 4.0),
      child: Container(
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmbedFullScreen(
                        heroTag: heroTag,
                        imageProvider: CachedNetworkImageProvider(
                          embed.preview,
                        )),
                  ));
            },
            child: Hero(
              tag: heroTag,
              child: CachedNetworkImage(
                placeholder: Image.memory(kTransparentImage),
                imageUrl: embed.preview,
                height: 200,
              ),
            )),
      ),
    );
  }
}
