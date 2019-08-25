import 'package:flutter/material.dart';
import 'package:owmflutter/widgets/widgets.dart';

class SpoilerWidget extends StatefulWidget {
  final String text;
  final Color textColor;
  final double textSize;

  SpoilerWidget({
    this.text,
    this.textColor,
    this.textSize,
  });

  _SpoilerWidgetState createState() => _SpoilerWidgetState();
}

class _SpoilerWidgetState extends State<SpoilerWidget> {
  bool showSpoiler = false;

  @override
  Widget build(BuildContext context) {
    return OWMSettingListener(
      rebuildOnChange: (settings) => settings.hideSpoilerTextStream,
      builder: (context, settings) => OWMSettingListener(
        rebuildOnChange: (settings) => settings.openSpoilerDialogStream,
        builder: (context, settings) => GestureDetector(
          onTap: () => setState(() {
            showSpoiler = settings.hideSpoilerText ? !showSpoiler : true;
            _showSpoilerDialog(settings.openSpoilerDialog == true);
          }),
          child: showSpoiler && settings.openSpoilerDialog == false
              ? BodyWidget(
                  textColor: widget.textColor,
                  textSize: widget.textSize,
                  body: Uri.decodeFull(widget.text).replaceAll('+', ' '),
                  //TODO: Klikalne linki w spoilerach
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 6.0),
                      child: Icon(
                        Icons.visibility,
                        size: (widget.textSize ?? 14.0) * 1.2,
                        color: widget.textColor,
                      ),
                    ),
                    Text(
                      'Pokaż spoiler',
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
    );
  }

  void _showSpoilerDialog(bool show) {
    if (show) {
      showDialog(
        context: context,
        builder: (_) => GreatDialogWidget(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BodyWidget(
                body: Uri.decodeFull(widget.text).replaceAll('+', ' '),
                //TODO: Klikalne linki w spoilerach
              ),
            ],
          ),
        ),
      );
    }
  }
}
