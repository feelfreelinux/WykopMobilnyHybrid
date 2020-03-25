import 'package:flutter/material.dart';

class EntryToolbarButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  EntryToolbarButtonWidget(this.icon, this.title, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            border: Border.all(color: Colors.grey.withOpacity(0.4)),
          ),
          child: Tooltip(
            message: title,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: onPressed,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Icon(icon, size: 28.0),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 8.0),
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
