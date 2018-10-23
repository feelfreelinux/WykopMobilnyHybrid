import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:flutter/material.dart';

class EmbedWidget extends StatelessWidget {
  final Embed embed;
  EmbedWidget({this.embed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Image.network(embed.preview),
    );
  }
}
