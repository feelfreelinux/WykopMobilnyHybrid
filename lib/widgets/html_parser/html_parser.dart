import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html show parse;
import 'package:html/dom.dart' as html;
import 'package:owmflutter/screens/profile.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/navigator/navigator.dart';
import 'package:flutter/gestures.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/screens/screens.dart';
import 'spoiler.dart';
import 'dart:ui';

/*
 * HtmlWidget 
 * 
 * Specialized html parser that utilizes both widgets and RichText for fancy views support.
 * Base from `wiki-flutter` client. Thanks a lot!
*/
class HtmlWidget extends StatelessWidget {
  const HtmlWidget({
    Key key,
    this.html,
    this.textColor,
    this.textSize,
    this.linkColor,
  }) : super(key: key);

  final String html;
  final Color textColor;
  final double textSize;
  final Color linkColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _HtmlParser(
        context,
        textColor: textColor,
        textSize: textSize,
        linkColor: linkColor,
      ).parseFromStr(
        (html ?? "")
            .replaceAll('<cite>  ', '<cite>')
            .replaceAll('<br />', '<br/>')
            .replaceAll('<br/>\n  ', '<br/>')
            .replaceAll('<br/>\n<a href="spoiler:', '\n<a href="spoiler:')
            .replaceAll(
                '">[pokaż spoiler]</a><br/>\n', '">[pokaż spoiler]</a>\n')
            .replaceAll('&quot;', '"'),
      ),
    );
  }
}

class _HtmlParser {
  final BuildContext context;
  final Map appContext;
  final bool nested;
  final Color textColor;
  final double textSize;
  final Color linkColor;

  _HtmlParser(
    this.context, {
    this.nested: false,
    this.appContext: const {},
    this.textColor,
    this.textSize,
    this.linkColor,
  });

  List<Widget> _widgets = [];
  List<TextSpan> _currentTextSpans = [];

  Widget parseFromStr(String htmlStr) {
    final html.Node body = html.parse(htmlStr).body;

    _parseNode(body);
    _tryCloseCurrentTextSpan();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _widgets,
    );
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

    _currentTextSpans.add(
      TextSpan(
        text: trimmedText,
        style: style ??
            TextStyle(
              fontSize: textSize,
              color: textColor ?? Theme.of(context).textTheme.headline.color,
              height: 1.1,
            ),
      ),
    );
  }

  Widget parseFromElement(html.Element element) {
    _parseNode(element);
    _tryCloseCurrentTextSpan();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _widgets,
    );
  }

  void _parseElement(html.Element element) {
    switch (element.localName) {
      case 'span':
      case 'em':
        _tokenizeBody(
          element.text,
          style: TextStyle(
            fontSize: textSize,
            fontStyle: FontStyle.italic,
            color: textColor,
          ),
        );
        break;
      case 'br':
        _currentTextSpans.add(TextSpan(text: '\n'));
        return;
      case 'strong':
        _tokenizeBody(
          element.text,
          style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        );
        return;
      case 'code':
        _tokenizeBody(
          element.text,
          style: TextStyle(
            fontSize: textSize,
            fontFamily: 'Monospace',
            color: textColor,
          ),
        );
        return;
      case 'a':
        if (element.attributes['href'].startsWith('spoiler:')) {
          _tryCloseCurrentTextSpan();
          _widgets.add(
            SpoilerWidget(
              textColor: textColor,
              textSize: textSize,
              text: element.attributes['href'].substring(
                8,
                element.attributes['href'].length,
              ),
            ),
          );
          return;
        } else if (element.attributes['href'].startsWith('#')) {
          _currentTextSpans.add(
            ClickableTextSpan(
              text: element.text,
              onTap: () {
                Navigator.push(
                  context,
                  Utils.getPageTransition(
                    TagScreen(tag: element.text),
                  ),
                );
              },
              style: TextStyle(
                fontSize: textSize,
                decoration: linkColor != textColor && linkColor != null
                    ? TextDecoration.none
                    : TextDecoration.underline,
                color: linkColor ?? textColor,
              ),
            ),
          );
          return;
        } else if (element.attributes['href'].startsWith('@')) {
          _currentTextSpans.add(
            ClickableTextSpan(
              text: element.text,
              onTap: () {
                Navigator.push(
                  context,
                  Utils.getPageSlideRight(
                      ProfileScreen(username: element.text)),
                );
              },
              style: TextStyle(
                fontSize: textSize,
                decoration: linkColor != textColor && linkColor != null
                    ? TextDecoration.none
                    : TextDecoration.underline,
                color: linkColor ?? textColor,
              ),
            ),
          );
          return;
        } else if (element.hasContent() &&
            (element.nodes.length == 1) &&
            (element.firstChild.nodeType == html.Node.TEXT_NODE)) {
          var url = element.attributes['href'];
          _currentTextSpans.add(
            ClickableTextSpan(
              text: element.text,
              onTap: () {
                WykopNavigator.handleUrl(context, url);
              },
              style: TextStyle(
                fontSize: textSize,
                decoration: TextDecoration.underline,
                color: linkColor ?? textColor,
              ),
            ),
          );
          return;
        }

        for (var subNode in element.nodes) {
          _parseNode(subNode);
        }

        return;
      case 'cite':
        if (!nested) {
          _tokenizeBody(
            '„' + element.text + '“',
            style: TextStyle(
              fontSize: textSize,
              color: textColor.withOpacity(0.6),
            ),
          );
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
      RichText(
        overflow: TextOverflow.clip,
        softWrap: true,
        text: TextSpan(
          style: TextStyle(
            fontSize: textSize,
            color: textColor ?? Theme.of(context).textTheme.headline.color,
          ),
          children: List.from(_currentTextSpans),
        ),
      ),
    );

    _currentTextSpans.clear();
  }
}

class ClickableTextSpan extends TextSpan {
  ClickableTextSpan({
    TextStyle style,
    String text,
    VoidCallback onTap,
    VoidCallback onTapUp,
    VoidCallback onTapDown,
    List<TextSpan> children,
  }) : super(
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
            },
        );
}
