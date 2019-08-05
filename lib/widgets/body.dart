import 'package:flutter/material.dart';
import 'html_parser/html_parser.dart';
import 'package:html/parser.dart';

class BodyWidget extends StatefulWidget {
  final String body;
  final bool ellipsize;
  final EdgeInsets padding;
  final Color textColor;
  final double textSize;
  final Color linkColor;

  BodyWidget({
    this.body,
    this.ellipsize = false,
    this.padding,
    this.textColor,
    this.textSize,
    this.linkColor,
  });

  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    String bodyString = parse(widget.body ?? "").documentElement.text;

    return Visibility(
      visible: widget.body != null && widget.body != "​​​​​",
      child: Padding(
        padding: widget.padding ?? EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HtmlWidget(
              textColor:
                  widget.textColor ?? Theme.of(context).textTheme.body1.color,
              linkColor: widget.linkColor ?? Theme.of(context).accentColor,
              textSize: widget.textSize,
              html: widget.body != null
                  ? !expand && bodyString.length > 300 && widget.ellipsize
                      ? widget.body.substring(0, 300) + '...'
                      : widget.body
                  : '',
              //TODO: Jakoś lepiej liczyć i ciąć tekst bo łapie html ^^^
            ),
            Visibility(
              visible: bodyString.length > 300 && widget.ellipsize && !expand,
              child: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      expand = true;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 6.0),
                        child: Icon(
                          Icons.arrow_downward,
                          size: (widget.textSize ?? 14.0) * 1.2,
                          color: widget.textColor,
                        ),
                      ),
                      Text(
                        'Pokaż więcej',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: widget.textSize,
                          color: widget.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
