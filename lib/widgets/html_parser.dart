import 'package:flutter/material.dart';

import 'package:html/parser.dart' as html show parse;
import 'package:html/dom.dart' as html;
import 'package:owmflutter/widgets/spoiler.dart';
import 'package:owmflutter/navigator/navigator.dart';
import 'package:flutter/gestures.dart';

import 'dart:ui';

/*
 * HtmlWidget 
 * 
 * Specialized html parser that utilizes both widgets and RichText for fancy views support.
 * Base from `wiki-flutter` client. Thanks a lot!
*/
class HtmlWidget extends StatelessWidget {
  const HtmlWidget({Key key, this.html}) : super(key: key);

  final String html;

  @override
  Widget build(BuildContext context) {
    return new _HtmlParser(context).parseFromStr(html
        .replaceAll('<cite> ', '<cite>')
        .replaceAll('<br /> ', '<br/>')
        .replaceAll('&quot;', '"'));
  }
}

class _HtmlParser {
  final BuildContext context;

  final Map appContext;
  final bool nested;

  final TextTheme textTheme;

  _HtmlParser(this.context, {this.nested: false, this.appContext: const {}})
      : textTheme = Theme.of(context).textTheme;

  List<Widget> _widgets = [];
  List<TextSpan> _currentTextSpans = [];

  Widget parseFromStr(String htmlStr) {
    final html.Node body = html.parse(htmlStr).body;

    _parseNode(body);
    _tryCloseCurrentTextSpan();

    return new Container(
        width: MediaQuery.of(context).size.width,
        child: Wrap(children: _widgets));
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

    _currentTextSpans.add(TextSpan(text: trimmedText, style: style ?? TextStyle(color: Theme.of(context).textTheme.headline.color)));
  }

  Widget parseFromElement(html.Element element) {
    _parseNode(element);
    _tryCloseCurrentTextSpan();

    return new Column(children: _widgets);
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
          _widgets.add(new SpoilerWidget());
          return;
        } else if (element.attributes['href'].startsWith('#')) {
          _tokenizeBody(element.text,
              style: TextStyle(
                  color: Colors.blueAccent, fontWeight: FontWeight.bold));
          return;
        } else if (element.attributes['href'].startsWith('@')) {
          _tokenizeBody(element.text,
              style: TextStyle(
                  color: Colors.blueAccent, fontWeight: FontWeight.bold));
          return;
        } else if (element.hasContent() &&
            (element.nodes.length == 1) &&
            (element.firstChild.nodeType == html.Node.TEXT_NODE)) {
          var url = element.attributes['href'];
          _currentTextSpans.add(TextSpan(
              text: element.text,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  WykopNavigator.handleUrl(context, url);
                  /*
                  Clipboard.setData(ClipboardData(text: url));
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("Skopiowano url do schowka"),
              ));*/
                },
              style: TextStyle(
                  color: Colors.blueAccent, fontWeight: FontWeight.bold)));
          return;
        }

        for (var subNode in element.nodes) {
          _parseNode(subNode);
        }

        return;
      case 'cite':
        if (!nested) {
          _tryCloseCurrentTextSpan();
          _widgets.add(Wrap(children: [
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
                style: TextStyle(color: Theme.of(context).textTheme.headline.color),
                children: new List.from(_currentTextSpans))),
      ),
    );

    _currentTextSpans.clear();
  }
}
