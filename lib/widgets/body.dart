import 'package:flutter/material.dart';
import 'html_parser.dart';
import 'package:html/dom.dart' as dom;
import 'package:flutter_html_view/flutter_html_view.dart';

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
            data: body != null
                ? body.length > 300 && ellipsize
                    ? body.substring(0, 200) + '...'
                    : body
                : ''));
  }

  Widget _renderSpoiler(BuildContext context, dom.Node node) {
    return Text(node.text);
  }

  Widget _renderA(BuildContext context, dom.Node node) {
    return Text(node.text, style: TextStyle(color: Theme.of(context).accentColor),);
  }
}

class Html extends StatelessWidget {
  Html({
    Key key,
    @required this.data,
    this.padding,
    this.backgroundColor,
    this.defaultTextStyle,
    this.onLinkTap,
    this.renderNewlines = false,
    this.customRender,
    this.useRichText = false,
  }) : super(key: key);

  final String data;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final TextStyle defaultTextStyle;
  final OnLinkTap onLinkTap;
  final bool renderNewlines;
  final bool useRichText;

  /// Either return a custom widget for specific node types or return null to
  /// fallback to the default rendering.
  final CustomRender customRender;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      padding: padding,
      color: backgroundColor,
      width: width,
      child: DefaultTextStyle.merge(
        style: defaultTextStyle ?? DefaultTextStyle.of(context).style,
        child: HtmlRichTextParser(
          width: width,
          onLinkTap: onLinkTap,
          renderNewlines: renderNewlines,
          html: data,
        )
      
    ));
  }
}