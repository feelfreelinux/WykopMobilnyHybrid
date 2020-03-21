import 'package:flutter/material.dart';
import 'package:owmflutter/model/shadow_control_model.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AppbarNormalWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget leading;
  final Widget center;
  final List<Widget> actions;
  final Color iconColor;
  final EdgeInsets padding;
  final EdgeInsets titlePadding;
  final bool shadow;
  final Widget bottom;
  final double bottomHeight;
  final double toolbarHeight;

  AppbarNormalWidget({
    this.title,
    this.actions,
    this.center,
    this.iconColor,
    this.leading,
    this.padding,
    this.titlePadding = const EdgeInsets.symmetric(horizontal: 8.0),
    this.shadow,
    this.bottom,
    this.bottomHeight = 48.0,
    this.toolbarHeight = kToolbarHeight,
  });

  @override
  Size get preferredSize {
    return Size.fromHeight(
        bottom != null ? toolbarHeight + bottomHeight : toolbarHeight);
  }

  _AppbarNormalWidgetState createState() => _AppbarNormalWidgetState();
}

class _AppbarNormalWidgetState extends State<AppbarNormalWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShadowControlModel>(
      builder: (context, shadowControlModel, _) => AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: Utils.appBarShadow(
            widget.shadow ?? shadowControlModel.showTopShadow),
        child: AppBar(
          bottom: widget.bottom != null
              ? PreferredSize(
                  preferredSize: Size.fromHeight(widget.bottomHeight),
                  child: widget.bottom,
                )
              : null,
          automaticallyImplyLeading: false,
          title: Container(
            padding: widget.padding,
            child: Row(
              children: <Widget>[
                widget.leading ??
                    IconButtonWidget(
                      icon: Icons.arrow_back,
                      onTap: () => Navigator.of(context).pop(),
                    ),
                Expanded(
                  child: widget.center ??
                      Container(
                        padding: widget.titlePadding,
                        child: Text(
                          widget.title ?? '',
                          style: TextStyle(
                            height: 1.0,
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
        ),
      ),
    );
  }
}
