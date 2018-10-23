import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:flutter/material.dart';

class EmbedWidget extends StatelessWidget {
  final Embed embed;
  EmbedWidget({this.embed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.0),
      child: Image.network(embed.preview),
    );
  }
}
