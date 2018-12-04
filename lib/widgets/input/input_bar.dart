import 'package:flutter/material.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'photo_bottomSheet.dart';

class InputBarWidget extends StatefulWidget {
  _InputBarWidgetState createState() => _InputBarWidgetState();
}

class _InputBarWidgetState extends State<InputBarWidget> {
  bool showMarkdownBar = false;
  bool showMediaButton = true;
  bool clickTextField = false;
  bool isEmpty = true;
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        child: BottomAppBar(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [_drawInputBar(), _drawButtons()])));
  }

  @override
  void initState() {
    super.initState();
    textController.addListener(() => _watchTextChanges());
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  _watchTextChanges() {
    if (textController.text != null && textController.text.length >= 3) {
      if (isEmpty) {
        setState(() {
          isEmpty = false;
        });
      }
    } else if (!isEmpty) {
      setState(() {
        isEmpty = true;
      });
    }
  }

  Widget _drawInputBar() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          _drawShowMarkdownButton(),
          _drawMediaButton(),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 6.0),
                  padding: const EdgeInsets.only(
                      left: 12.0, top: 1.0, right: 1.0, bottom: 1.0),
                  decoration: BoxDecoration(
                      color: Color(0x267f7f7f),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(16.0))),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Flexible(
                            child: ConstrainedBox(
                                constraints: BoxConstraints(maxHeight: 90.0),
                                child: Scrollbar(
                                    child: SingleChildScrollView(
                                        reverse: true,
                                        child: TextField(
                                            cursorWidth: 1.5,
                                            cursorRadius: Radius.circular(20.0),
                                            style: DefaultTextStyle.of(context)
                                                .style
                                                .merge(
                                                    TextStyle(fontSize: 14.0)),
                                            maxLines: null,
                                            controller: this.textController,
                                            keyboardType:
                                                TextInputType.multiline,
                                            onTap: () {
                                              setState(() {
                                                showMediaButton = false;
                                                clickTextField = true;
                                              });
                                            },
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                border: InputBorder.none,
                                                hintText:
                                                    'Treść komentarza')))))),
                        _drawEmoticonButton()
                      ]))),
          _drawSendButton()
        ]));
  }

  Widget _drawButtons() {
    if (showMarkdownBar) {
      return Container(
          //color: Theme.of(context).backgroundColor,
          padding: const EdgeInsets.only(bottom: 8.0, left: 6.0, right: 6.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _drawIconRound(Icons.format_bold, () {}),
                _drawIconRound(Icons.format_italic, () {}),
                _drawIconRound(Icons.format_quote, () {}),
                _drawIconRound(Icons.link, () {}),
                _drawIconRound(Icons.code, () {}),
                _drawIconRound(OwmGlyphs.ic_markdowntoolbar_spoiler, () => {}),
                _drawIconRound(Icons.format_list_bulleted, () => {}),
                _drawIconRound(Icons.image, () {}),
                _drawIconRound(Icons.fullscreen, () {})
              ]));
    } else {
      return Container();
    }
  }

  Widget _drawShowMarkdownButton() {
    return Container(
      padding: EdgeInsets.only(bottom: 6.0),
      child: InkWell(
          onTap: () {
            setState(() {
              showMarkdownBar = showMarkdownBar ? false : true;
              showMediaButton =
                  showMarkdownBar ? false : clickTextField ? false : true;
            });
          },
          borderRadius: BorderRadius.circular(100.0),
          child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                  showMarkdownBar ? Icons.remove_circle : Icons.add_circle,
                  size: 26.0,
                  color: Colors.blueAccent))),
    );
  }

  Widget _drawMediaButton() {
    if (showMediaButton) {
      return Container(
        padding: EdgeInsets.only(bottom: 6.0),
        child: InkWell(
            onTap: () {
              PhotoBottomSheetWidget();
            },
            borderRadius: BorderRadius.circular(100.0),
            child: Padding(
                padding: const EdgeInsets.all(6.0),
                child:
                    Icon(Icons.image, size: 26.0, color: Colors.blueAccent))),
      );
    } else {
      return Container();
    }
  }

  Widget _drawEmoticonButton() {
    return InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(100.0),
        child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(Icons.mood, color: Colors.blueAccent)));
  }

  Widget _drawSendButton() {
    return Container(
      padding: EdgeInsets.only(bottom: 6.0),
      child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(100.0),
          child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(Icons.send,
                  size: 26.0,
                  color: isEmpty ? Colors.grey : Colors.blueAccent))),
    );
  }

  Widget _drawIconRound(IconData iconData, VoidCallback onClick) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Color(0x337f7f7f), width: 1.0)),
        child: InkWell(
            onTap: onClick,
            borderRadius: BorderRadius.circular(100.0),
            child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(iconData, size: 18.0))));
  }
}
