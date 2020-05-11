import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:owmflutter/app.dart';

class ContentHiddenWidget extends StatelessWidget {
  final VoidCallback onTap;

  ContentHiddenWidget({this.onTap});

  @override
  Widget build(BuildContext context) {
    if (owmSettings.hideExpandContent) return Container();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.0,
              offset: Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(18),
          color: Theme.of(context).backgroundColor,
          border: Border.all(color: Theme.of(context).dialogBackgroundColor),
        ),
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: Text(
            "Pokaż ukrytą treść",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
