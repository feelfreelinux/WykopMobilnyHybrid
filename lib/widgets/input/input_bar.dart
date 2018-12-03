import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/widgets/widgets.dart';

class InputBarWidget extends StatefulWidget {
  _InputBarWidgetState createState() => _InputBarWidgetState();
}

class _InputBarWidgetState extends State<InputBarWidget> {
  bool showMarkdownBar = false;
  bool isEmpty = true;
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
          child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _drawButtons(),
            _drawInputBar(),
          ],
        ),
      ),
    );
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

  Widget _drawInputBar() {
    return Row(children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                border: Border.all(color: Colors.grey[200], width: 1),
                borderRadius:
                    new BorderRadius.all(const Radius.circular(10.0))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: TextField(
                  maxLines: null,
                  controller: this.textController,
                  keyboardType: TextInputType.multiline,
                  onTap: () {
                    setState(() {
                      showMarkdownBar = true;
                    });
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Treść komentarza')),
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {},
        child: Padding(
          padding:
              const EdgeInsets.only(left: 8.0, top: 8, right: 16, bottom: 8),
          child: Icon(
            Icons.send,
            color: isEmpty ? Colors.grey : Colors.black,
          ),
        ),
      ),
    ]);
  }

  _watchTextChanges() {
    if (textController.text != null && textController.text.length > 3) {
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

  Widget _drawButtons() {
    if (showMarkdownBar) {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 16.0, top: 8.0),
        child: Row(children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _drawIcon(OwmGlyphs.ic_markdowntoolbar_bold, () {}),
                _drawIcon(OwmGlyphs.ic_markdowntoolbar_code, () {}),
                _drawIcon(OwmGlyphs.ic_markdowntoolbar_italic, () {}),
                _drawIcon(OwmGlyphs.ic_markdowntoolbar_link, () {}),
                _drawIcon(OwmGlyphs.ic_markdowntoolbar_quote, () {}),
                _drawIcon(OwmGlyphs.ic_markdowntoolbar_photo, () {}),
                _drawIcon(OwmGlyphs.ic_markdowntoolbar_spoiler, () => {}),
              ],
            ),
          ),
          _drawIcon(Icons.close, () {
            setState(() {
              showMarkdownBar = false;
            });
          }),
        ]),
      );
    } else {
      return Container();
    }
  }

  Widget _drawIcon(IconData iconData, VoidCallback onClick) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Icon(
          iconData,
          size: 26,
        ),
      ),
    );
  }
}
