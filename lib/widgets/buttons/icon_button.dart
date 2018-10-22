import 'package:flutter/material.dart';

class FooterIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onClicked;

  FooterIconButton({@required this.icon, @required this.onClicked});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(icon,
                  size: 20.0, color: Theme.of(context).textTheme.caption.color),
            ],
          )),
      onTap: this.onClicked,
    );
  }
}
