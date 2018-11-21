import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class BodyWidget extends StatelessWidget {
  final String body;
  final bool ellipsize;
  final EdgeInsets padding;
  BodyWidget(
      {this.body,
      this.ellipsize,
      this.padding: const EdgeInsets.only(left: 12, right: 12, bottom: 14)});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: Html(
            defaultTextStyle: TextStyle(fontSize: 13.0, height: 1.10),
            data: body != null
                ? body.length > 300 && ellipsize
                    ? body.substring(0, 200) + '...'
                    : body
                : ''));
  }
}
