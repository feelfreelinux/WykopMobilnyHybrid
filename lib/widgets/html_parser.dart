import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:html/parser.dart' as html show parse;
import 'package:html/dom.dart' as html;
import 'package:owmflutter/widgets/spoiler.dart';
import 'package:owmflutter/widgets/tag.dart';

import 'package:url_launcher/url_launcher.dart';

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
    return new _HtmlParser(context).parseFromStr(
        html.replaceAll("#<a href=", "<a href=").replaceAll('\n', '<br/>'));
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
        // Remove all unnesesary blank lines, we're handling them via <br/> widget
        final trimmedText = node.text.replaceAll('\n', '');

        if (trimmedText.length == 0) {
          _tryCloseCurrentTextSpan();
          return;
        }

        _appendToCurrentTextSpans(trimmedText);
        return;
      default:
        break;
    }
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
        _appendToCurrentTextSpans(TextSpan(
            text: element.text, style: TextStyle(fontStyle: FontStyle.italic)));
        break;
      case 'br':
        _tryCloseCurrentTextSpan();
        _widgets.add(Container(
          width: MediaQuery.of(context).size.width,
          height: 4,
        ));
        return;
      case 'strong':
        _appendToCurrentTextSpans(TextSpan(
            text: element.text, style: TextStyle(fontWeight: FontWeight.bold)));
        // for (var subNode in element.nodes) { _parseNode(subNode); }
        return;
      case 'code':
        _appendToCurrentTextSpans(TextSpan(
            text: element.text, style: TextStyle(fontFamily: 'Monospace')));
        // for (var subNode in element.nodes) { _parseNode(subNode); }
        return;
      case 'a':
        if (element.attributes['href'].startsWith('spoiler:')) {
          _tryCloseCurrentTextSpan();
          _widgets.add(Wrap(children: [new SpoilerWidget()]));
          return;
        } else if (element.attributes['href'].startsWith('#')) {
          _tryCloseCurrentTextSpan();
          _widgets.add(Wrap(children: [new TagWidget(element.text)]));
          return;
        } else if (element.hasContent() &&
            (element.nodes.length == 1) &&
            (element.firstChild.nodeType == html.Node.TEXT_NODE)) {
          final text = element.text;
          final href = element.attributes['href'];

          _appendToCurrentTextSpans(
              _textLink(context: context, text: text, href: href));

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
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: !nested
                    ? (new _HtmlParser(context, nested: true))
                        .parseFromElement(element)
                    : Text(element.text),
              ),
            )
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
      new RichText(
          text: new TextSpan(
              style: TextStyle(color: Colors.black),
              children: new List.from(_currentTextSpans))),
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
