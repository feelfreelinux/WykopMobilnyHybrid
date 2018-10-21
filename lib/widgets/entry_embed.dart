import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:flutter/material.dart';

class EntryEmbedWidget extends StatelessWidget {
  final EntryEmbed embed;
  EntryEmbedWidget({this.embed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Image.network(embed.preview),
    );
  }
}
