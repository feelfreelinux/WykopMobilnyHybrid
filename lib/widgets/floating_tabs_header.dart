import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/model/model.dart';
import 'package:provider/provider.dart';

class FloatingTabsHeader extends StatelessWidget {
  final List<Widget> children;

  FloatingTabsHeader({this.children});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: SizedSliverHeaderDelegate(
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
                  padding: EdgeInsets.only(
                      bottom: 6.0, top: 10.0, right: 18.0, left: 18.0),
                  child: Row(
                    children: children,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
