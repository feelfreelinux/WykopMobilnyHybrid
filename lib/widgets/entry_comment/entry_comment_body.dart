import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:flutter/material.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';

class EntryCommentBodyWidget extends StatelessWidget {
  final EntryComment comment;
  EntryCommentBodyWidget({this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: new MarkdownBody(
            data: html2md.convert(comment.body != null ? comment.body : '')),
      ),
    );
  }
}
