import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class BodyWidget extends StatelessWidget {
  final String body;
  final bool ellipsize;
  BodyWidget({this.body, this.ellipsize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Html(
            data: body != null
                ? body.length > 300 && ellipsize
                    ? body.substring(0, 200) + '...'
                    : body
                : ''),
      ),
    );
  }
}
