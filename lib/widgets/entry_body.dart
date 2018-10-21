import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:flutter/material.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';

class EntryBodyWidget extends StatelessWidget {
  final EntryResponse entry;
  EntryBodyWidget({this.entry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: new MarkdownBody(
            data: html2md.convert(entry.body != null ? entry.body : '')),
      ),
    );
  }
}
