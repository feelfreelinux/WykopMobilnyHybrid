import 'package:flutter/material.dart';

class SendButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool sending;
  final bool isEmpty;
  SendButtonWidget({
    @required this.onTap,
    @required this.sending,
    @required this.isEmpty,
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
                  size: 26.0,
                  color: isEmpty ? Colors.grey : Theme.of(context).accentColor,
                ),
        ),
      ),
    );
  }
}
