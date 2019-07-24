import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';

class SendButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool sending;
  final bool isEmpty;
  final Color iconColor;
  SendButtonWidget({
    @required this.onTap,
    @required this.sending,
    @required this.isEmpty,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 6.0,
      ),
      child: InkWell(
        onTap: isEmpty ? null : onTap,
        borderRadius: BorderRadius.circular(100.0),
        child: Padding(
          padding: EdgeInsets.all(6.0),
          child: sending
              ? Container(
                  width: 26.0,
                  height: 26.0,
                  child: CircularProgressIndicator(),
                )
              : Icon(
                  Icons.send,
                  size: 28.0,
                  color: isEmpty
                      ? Utils.backgroundGreyOpacity(context)
                      : iconColor ?? Theme.of(context).accentColor,
                ),
        ),
      ),
    );
  }
}
