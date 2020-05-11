import 'package:flutter/material.dart';

class ToolbarButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String tooltip;
  final VoidCallback onTap;
  final int countPortrait;
  final int countLandscape;
  final bool disabled;
  final bool visible;

  ToolbarButtonWidget({
    @required this.icon,
    @required this.title,
    this.tooltip,
    @required this.onTap,
    this.countPortrait = 3,
    this.countLandscape = 6,
    this.disabled = false,
    this.visible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Material(
        type: MaterialType.transparency,
        child: Opacity(
          opacity: disabled ? 0.5 : 1.0,
          child: IgnorePointer(
            ignoring: disabled,
            child: Container(
              width: ((MediaQuery.of(context).size.width - 28.0) /
                      (MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? countPortrait
                          : countLandscape)) -
                  10.0,
              margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                border: Border.all(color: Colors.grey.withOpacity(0.4)),
              ),
              child: Tooltip(
                message: tooltip ?? title,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: onTap,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 12.0),
                          child: Icon(icon, size: 30.0),
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
        ),
      ),
    );
  }
}
