import 'package:flutter/material.dart';

import 'package:html/parser.dart' as html show parse;
import 'package:html/dom.dart' as html;
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/widgets/spoiler.dart';
import 'package:owmflutter/navigator/navigator.dart';
import 'package:flutter/gestures.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/themes.dart';

import 'dart:ui';

/*
 * HtmlWidget 
 * 
 * Specialized html parser that utilizes both widgets and RichText for fancy views support.
 * Base from `wiki-flutter` client. Thanks a lot!
*/
class HtmlWidget extends StatelessWidget {
  const HtmlWidget({Key key, this.html, this.blackText = false}) : super(key: key);

  final String html;
  final bool blackText;

  @override
  Widget build(BuildContext context) {
    return new Container(
      
      child:
      _HtmlParser(context, blackText: blackText).parseFromStr(html
          .replaceAll('<cite> ', '<cite>')
          .replaceAll('<br /> ', '<br/>')
          .replaceAll('&quot;', '"'))
    );
  }
}

class _HtmlParser {
  final BuildContext context;
  final Map appContext;
  final bool nested;

  final bool blackText;

  _HtmlParser(this.context, {this.nested: false, this.appContext: const {}, this.blackText = false});

  List<Widget> _widgets = [];
  List<TextSpan> _currentTextSpans = [];

  Widget parseFromStr(String htmlStr) {
    final html.Node body = html.parse(htmlStr).body;

    _parseNode(body);
    _tryCloseCurrentTextSpan();

    return new Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: _widgets));
  }

  void _parseNode(html.Node node) {
    switch (node.nodeType) {
      case html.Node.ELEMENT_NODE:
        _parseElement(node as html.Element);
        return;
      case html.Node.TEXT_NODE:
        _tokenizeBody(node.text);
        return;
      default:
        break;
    }
  }

  void _tokenizeBody(String body, {style}) {
    final trimmedText = body.replaceAll('\n', '');

    _currentTextSpans.add(TextSpan(
        text: trimmedText,
        style: style ??
            TextStyle(
                color: blackText ? Colors.black : Theme.of(context).textTheme.headline.color,
                height: 1.1)));
  }

  Widget parseFromElement(html.Element element) {
    _parseNode(element);
    _tryCloseCurrentTextSpan();

    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: _widgets);
  }

  void _parseElement(html.Element element) {
    switch (element.localName) {
      case 'span':
      case 'em':
        _tokenizeBody(element.text,
            style: TextStyle(fontStyle: FontStyle.italic));
        break;
      case 'br':
        _currentTextSpans.add(TextSpan(text: '\n'));
        return;
      case 'strong':
        _tokenizeBody(element.text,
            style: TextStyle(fontWeight: FontWeight.bold));
        return;
      case 'code':
        _tokenizeBody(element.text, style: TextStyle(fontFamily: 'Monospace'));
        return;
      case 'a':
        if (element.attributes['href'].startsWith('spoiler:')) {
          _tryCloseCurrentTextSpan();
          _widgets.add(new SpoilerWidget(
              text: element.attributes['href']
                  .substring(8, element.attributes['href'].length)));
          return;
        } else if (element.attributes['href'].startsWith('#')) {
          _currentTextSpans.add(ClickableTextSpan(
              onTapDown: () {
                ActiveGestureDetectorWidget.of(context).changeState(false);
              },
              onTapUp: () {
                ActiveGestureDetectorWidget.of(context).changeState(true);
              },
              text: element.text,
              onTap: () {
                Navigator.push(context,
                    Utils.getPageTransition(TagScreen(tag: element.text)));
              },
              style: TextStyle(
                color: Colors.blueAccent,
              )));
          return;
        } else if (element.attributes['href'].startsWith('@')) {
          _tokenizeBody(element.text,
              style: TextStyle(
                color: Colors.blueAccent,
              ));
          return;
        } else if (element.hasContent() &&
            (element.nodes.length == 1) &&
            (element.firstChild.nodeType == html.Node.TEXT_NODE)) {
          var url = element.attributes['href'];
          _currentTextSpans.add(ClickableTextSpan(
              onTapDown: () {
                ActiveGestureDetectorWidget.of(context).changeState(false);
              },
              onTapUp: () {
                ActiveGestureDetectorWidget.of(context).changeState(true);
              },
              text: element.text,
              onTap: () {
                WykopNavigator.handleUrl(context, url);
              },
              style: TextStyle(
                color: Colors.blueAccent,
              )));
          return;
        }

        for (var subNode in element.nodes) {
          _parseNode(subNode);
        }

        return;
      case 'cite':
        if (!nested) {
          _tryCloseCurrentTextSpan();
          _widgets.add(
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                decoration: BoxDecoration(
                    color: Color(0x80f0f0f0),
                    borderRadius: BorderRadius.circular(4)),
                child: !nested
                    ? (new _HtmlParser(context, nested: true))
                        .parseFromElement(element)
                    : Text(element.text))
          ]));
          // for (var subNode in element.nodes) { _parseNode(subNode); }

          return;
        } else {
          for (var subNode in element.nodes) {
            _parseNode(subNode);
          }
        }
        break;
      default:
        for (var subNode in element.nodes) {
          _parseNode(subNode);
        }
        return;
    }
  }

  void _tryCloseCurrentTextSpan() {
    if (_currentTextSpans.isEmpty) {
      return;
    }

    _widgets.add(
      Container(
        child: new RichText(
            overflow: TextOverflow.clip,
            softWrap: true,
            text: new TextSpan(
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline.color),
                children: new List.from(_currentTextSpans))),
      ),
    );

    _currentTextSpans.clear();
  }
}

class ClickableTextSpan extends TextSpan {
  ClickableTextSpan(
      {TextStyle style,
      String text,
      VoidCallback onTap,
      VoidCallback onTapUp,
      VoidCallback onTapDown,
      List<TextSpan> children})
      : super(
            style: style,
            text: text,
            children: children ?? <TextSpan>[],
            recognizer: TapGestureRecognizer()
              ..onTapDown = (_) {
                onTapDown();
              }
              ..onTapUp = (_) {
                onTapUp();
              }
              ..onTap = () {
                onTap();
              });
}
