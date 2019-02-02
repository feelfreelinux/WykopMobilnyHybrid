import 'package:flutter/material.dart';

class AppbarNormalWidget extends PreferredSize {
  final String title;
  final Widget leading;
  final List<Widget> actions;
  final Color iconColor;
  AppbarNormalWidget({
    this.title,
    this.actions,
    this.iconColor,
    this.leading,
  });

  @override
  Size get preferredSize {
    return Size.fromHeight(48.0);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? ''),
      leading: leading,
      actions: actions,
      elevation: 1.5,
      iconTheme: IconThemeData(
        color: iconColor,
      ),
      titleSpacing: 0.0,
    );
  }
}
