import 'dart:async';

import 'package:flutter/material.dart';
import 'package:owmflutter/utils/owm_settings.dart';
import 'package:provider/provider.dart';

typedef Stream FindSettingConverter(OWMSettings settings);
typedef Widget SettingChildBuilder(BuildContext context, OWMSettings settings);

class OWMSettingListener extends StatelessWidget {
  final FindSettingConverter rebuildOnChange;
  final SettingChildBuilder builder;
  OWMSettingListener({this.rebuildOnChange, this.builder});

  @override
  Widget build(BuildContext context) {
    return Consumer<OWMSettings>(
      builder: (context, settings, _) {
        return StreamBuilder(
          stream: rebuildOnChange(settings),
          builder: (context, _) => this.builder(context, settings)
        );
      }
    );
  }
}