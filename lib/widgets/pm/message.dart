import 'package:flutter/material.dart';
import 'package:owmflutter/keys.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:share/share.dart';
import 'package:html/parser.dart';

class MessageWidget extends StatefulWidget {
  const MessageWidget({
    Key key,
    @required this.message,
  }) : super(key: key);

  final PmMessage message;

  _MessageWidgetState createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget>
    with TickerProviderStateMixin {
  bool showDateState = false;
  bool showButtonsState = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 18.0),
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _drawDate(),
              Column(
                crossAxisAlignment: widget.message.isSentFromUser
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showDateState = !showDateState;
                      });
                    },
                    onLongPress: () {
                      setState(() {
                        if (widget.message.body == null ||
                            widget.message.body == "​​​​​") {
                          showDateState = !showDateState;
                        }
                        showButtonsState = !showButtonsState;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      margin: EdgeInsets.only(
                        left: widget.message.isSentFromUser ? 60.0 : 0.0,
                        right: widget.message.isSentFromUser ? 0.0 : 60.0,
                        bottom: showButtonsState ? 40.0 : 0.0,
                      ),
                      constraints: BoxConstraints.loose(
                        Size(
                            MediaQuery.of(context).size.width, double.infinity),
                      ),
                      decoration: BoxDecoration(
                        color: widget.message.isSentFromUser
                            ? Theme.of(context).accentColor
                            : Utils.backgroundGreyOpacity(context),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          BodyWidget(
                            textSize: 15.0,
                            textColor: widget.message.isSentFromUser
                                ? Colors.white
                                : Theme.of(context).textTheme.body1.color,
                            linkColor: widget.message.isSentFromUser
                                ? Colors.white
                                : Theme.of(context).accentColor,
                            body: widget.message.body,
                            ellipsize: false,
                            padding: EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 14.0,
                            ),
                          ),
                          _drawEmbed(widget.message),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0.0,
            left: widget.message.isSentFromUser ? null : 0.0,
            right: widget.message.isSentFromUser ? 0.0 : null,
            child: IgnorePointer(
              ignoring: !showButtonsState,
              child: AnimatedOpacity(
                opacity: showButtonsState ? 1 : 0,
                curve: Curves.linearToEaseOut,
                duration: Duration(milliseconds: 300),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.white
                            : Colors.grey[800],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6.0,
                            offset: Offset(0.0, 1.0),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.0,
                        vertical: 2.0,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: <Widget>[
                          _drawButtons(
                            Icons.share,
                            onTap: () {
                              Share.share(parse(widget.message.body ?? "")
                                  .documentElement
                                  .text);
                              //TODO: Dodać udostępnianie obrazka z wiadomości
                            },
                          ),
                          _drawButtons(
                            Icons.format_quote,
                            visible: widget.message.body != null &&
                                widget.message.body != "​​​​​",
                            onTap: () => OwmKeys.inputBarKey.currentState
                                .quoteText(widget.message.body),
                          ),
                          _drawButtons(
                            Icons.content_copy,
                            visible: widget.message.body != null &&
                                widget.message.body != "​​​​​",
                            onTap: () => Utils.copyToClipboard(
                                context,
                                parse(widget.message.body ?? "")
                                    .documentElement
                                    .text),
                          ),
                          _drawButtons(
                            Icons.file_download,
                            visible: widget.message.embed != null,
                            //TODO: Zapisywanie obrazka
                          ),
                        ],
                      ),
                    ),
                    _drawButtonClose()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawDate() {
    return AnimatedContainer(
      alignment: Alignment.topCenter,
      curve: Curves.linearToEaseOut,
      height: showDateState ? 16.0 : 0.0,
      duration: Duration(milliseconds: 400),
      child: Text(
        Utils.getDateFormat(
            widget.message.date, '\'Wysłano\' dd.MM.yyyy \'o\' HH:mm:ss'),
        style: TextStyle(
          color: Theme.of(context).textTheme.caption.color,
          fontSize: 11.0,
        ),
      ),
    );
  }

  Widget _drawButtons(IconData icon,
      {double size = 18.0, bool visible = true, VoidCallback onTap}) {
    return Visibility(
      visible: visible,
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Container(
          padding: EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Utils.backgroundGreyOpacity(context),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(8.0),
                child: Icon(icon, size: size),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawButtonClose() {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.message.body == null || widget.message.body == "​​​​​") {
            showDateState = !showDateState;
          }
          showButtonsState = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.grey[800],
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6.0,
              offset: Offset(0.0, 1.0),
            ),
          ],
        ),
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(right: 12.0),
        child: Icon(
          Icons.close,
          size: 28.0,
        ),
      ),
    );
  }

  Widget _drawEmbed(PmMessage entry) {
    return Visibility(
      visible: entry.embed != null,
      child: EmbedWidget(
        embed: entry.embed,
        borderRadius: 20.0,
        reducedWidth: 96.0,
      ),
    );
  }
}
