import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import 'package:html/parser.dart' as html show parse;
import 'package:html/dom.dart' as html;
import 'package:owmflutter/widgets/spoiler.dart';
import 'package:owmflutter/widgets/tag.dart';
import 'package:owmflutter/widgets/user_widget.dart';

import 'package:url_launcher/url_launcher.dart';

import 'dart:ui';
import 'dart:math';

/**
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
    return new _HtmlParser(context)
        .parseFromStr(html.replaceAll("#<a href=", "<a href=")
        .replaceAll('<cite> ', '<cite>')
        .replaceAll("@<a href=", "<a href=")
        .replaceAll('<br /> ', '<br/>'));
  }
}

class _HtmlParser {
  final BuildContext context;

  final Map appContext;
  final bool nested;

  final TextTheme textTheme;

  _HtmlParser(this.context, {this.nested: false, this.appContext: const {}})
      : textTheme = Theme.of(context).textTheme {}

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

  void _tokenizeBody(String body,
      {style = const TextStyle(color: Colors.black)}) {
    final trimmedText = body.replaceAll('\n', '');

    _tryCloseCurrentTextSpan();

    var words = trimmedText.split(' ');
    trimmedText.split(' ').asMap().forEach((index, value) {
      _widgets
          .add(Text(index == words.length ? value : value + ' ', style: style));
    });
  }

  Widget parseFromElement(html.Element element) {
    _parseNode(element);
    _tryCloseCurrentTextSpan();

    return new Wrap(children: _widgets);
  }

  void _parseElement(html.Element element) {
    switch (element.localName) {
      case 'span':
      case 'em':
        _tokenizeBody(element.text,
            style: TextStyle(fontStyle: FontStyle.italic));
        break;
      case 'br':
        _tryCloseCurrentTextSpan();
        _widgets.add(Container(
          width: MediaQuery.of(context).size.width,
          height: 0,
        ));
        return;
      case 'strong':
        _tokenizeBody(element.text,
            style: TextStyle(fontWeight: FontWeight.bold));
        // for (var subNode in element.nodes) { _parseNode(subNode); }
        return;
      case 'code':
        _tokenizeBody(element.text, style: TextStyle(fontFamily: 'Monospace'));
        // for (var subNode in element.nodes) { _parseNode(subNode); }
        return;
      case 'a':
        if (element.attributes['href'].startsWith('spoiler:')) {
          _tryCloseCurrentTextSpan();
          _widgets.add(new SpoilerWidget());
          return;
        } else if (element.attributes['href'].startsWith('#')) {
          _tryCloseCurrentTextSpan();
          _widgets.add(new TagWidget(element.text));
          return;
        } else if (element.attributes['href'].startsWith('@')) {
          _tryCloseCurrentTextSpan();
          _widgets.add(new UserWidget(element.text));
          return;
        } else if (element.hasContent() &&
            (element.nodes.length == 1) &&
            (element.firstChild.nodeType == html.Node.TEXT_NODE)) {
          var url = element.attributes['href'];
          _tryCloseCurrentTextSpan();
          _widgets.add(GestureDetector(
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: url));
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("Skopiowano url do schowka"),
              ));
            },
            onTap: () async {
              if (await canLaunch(url)) {
                launch(url);
              }
            },
            child:
                Text(element.text, style: TextStyle(color: Colors.blueAccent)),
          ));

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
        color: Colors.red,
        child: new RichText(
            overflow: TextOverflow.clip,
            softWrap: true,
            text: new TextSpan(
                style: TextStyle(color: Colors.black),
                children: new List.from(_currentTextSpans))),
      ),
    );

    _currentTextSpans.clear();
  }

  void _appendToCurrentTextSpans(dynamic stringOrTextSpan) {
    switch (stringOrTextSpan.runtimeType) {
      case String:
        // NOTE if the widget to be added, and the current last widget, are both Text, then we should append the text instead of widgets.
        if (_currentTextSpans.length > 0 &&
            _currentTextSpans.last.runtimeType == Text) {
          final String originalText = _currentTextSpans.last.text;
          final String mergedText = originalText + stringOrTextSpan;
          _currentTextSpans[_currentTextSpans.length - 1] =
              new TextSpan(text: mergedText);
        } else {
          _currentTextSpans.add(new TextSpan(text: stringOrTextSpan));
        }
        break;
      case TextSpan:
        _currentTextSpans.add(stringOrTextSpan);
        break;
    }
  }
}

TextSpan _textLink({BuildContext context, String text, String href}) {
  final linkStyle =
      Theme.of(context).textTheme.body1.copyWith(color: Colors.blue);

  TextSpan _textSpanForExternalLink() {
    final recognizer = new TapGestureRecognizer()
      ..onTap = () {
        launch(href);
      };

    return new TextSpan(text: text, style: linkStyle, recognizer: recognizer);
  }

  return _textSpanForExternalLink();
}
