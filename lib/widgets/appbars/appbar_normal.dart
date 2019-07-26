import 'package:flutter/material.dart';
import 'package:owmflutter/widgets/widgets.dart';

class AppbarNormalWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget leading;
  final Widget center;
  final List<Widget> actions;
  final Color iconColor;
  final EdgeInsets padding;
  final EdgeInsets titlePadding;

  AppbarNormalWidget({
    this.title,
    this.actions,
    this.center,
    this.iconColor,
    this.leading,
    this.padding,
    this.titlePadding = const EdgeInsets.symmetric(horizontal: 8.0),
  });

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }

  _AppbarNormalWidgetState createState() => _AppbarNormalWidgetState();
}

class _AppbarNormalWidgetState extends State<AppbarNormalWidget> {
  bool shadow = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(shadow ? 0.2 : 0.0),
              blurRadius: shadow ? 2.0 : 0.0,
            ),
          ],
        ),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            padding: widget.padding,
            child: Row(
              children: <Widget>[
                widget.leading ??
                    AppBarButton(
                      icon: Icons.arrow_back,
                      onTap: () => Navigator.of(context).pop(),
                      iconSize: 28.0,
                    ),
                Expanded(
                  child: widget.center ??
                      Container(
                        padding: widget.titlePadding,
                        child: Text(
                          widget.title ?? '',
                          style: TextStyle(
                            height: 0.9,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                ),
                Row(children: widget.actions ?? <Widget>[]),
              ],
            ),
          ),
          elevation: 0.0,
          titleSpacing: 0.0,
        ),);
      
    
  }
}
