import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/model/model.dart';
import 'package:provider/provider.dart';

class FloatingTabsHeader extends StatelessWidget {
  final List<Widget> children;
  final double size;
  final EdgeInsets padding;

  FloatingTabsHeader({this.children, this.size, this.padding});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: SizedSliverHeaderDelegate(
        size: size ?? 44,
        builder: (context) => OWMSettingListener(
          rebuildOnChange: (owmSettings) => owmSettings.useDarkThemeStream,
          builder: (context, settings) {
            var shadowControlModel =
                Provider.of<ShadowControlModel>(context, listen: false);
            return AnimatedContainer(
              duration: Duration(milliseconds: 200),
              decoration:
                  Utils.appBarShadow(shadowControlModel.showSubbarShadow),
              child: Material(
                color: Theme.of(context).backgroundColor,
                child: Padding(
                  padding: padding ?? EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
                  child: Row(children: children),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
