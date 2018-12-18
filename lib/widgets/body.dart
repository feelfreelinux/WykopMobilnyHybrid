import 'package:flutter/material.dart';
import 'html_parser.dart';

class BodyWidget extends StatelessWidget {
  final String body;
  final bool ellipsize;
  final EdgeInsets padding;
  BodyWidget({
    this.body,
    this.ellipsize,
    this.padding: const EdgeInsets.only(
      left: 12,
      right: 12,
      bottom: 12,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: HtmlWidget(
            html: body != null
                ? body.length > 300 && ellipsize
                    ? body.substring(0, 200) + '...'
                    : body
                : ''));
  }
}
