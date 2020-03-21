import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class AppearanceSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);

    return ChangeNotifierProvider<ShadowControlModel>(
      create: (context) => ShadowControlModel(),
      child: MediaQuery(
        data: mqDataNew,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppbarNormalWidget(
            title: "Wygląd aplikacji",
          ),
          body: ShadowNotificationListener(
              child: SingleChildScrollView(child: _drawList(context))),
        ),
      ),
    );
  }

  Widget _drawList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.useDarkThemeStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.useDarkTheme,
              title: Text(settings.useDarkTheme
                  ? "Tryb nocny włączony"
                  : "Tryb nocny wyłączony"),
              onChanged: (value) =>
                  settings.useDarkTheme = !settings.useDarkTheme,
            );
          },
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.autoDarkThemeStream,
          builder: (context, settings) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text("Automatyczny tryb nocny"),
                  subtitle:
                      Text(_autoDarkThemeSubtitle(settings.autoDarkTheme)),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => Dialog(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "Automatyczny tryb nocny",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              OWMSettingListener(
                                rebuildOnChange: (settings) =>
                                    settings.autoDarkThemeStream,
                                builder: (context, settings) {
                                  return Column(
                                    children: <Widget>[
                                      RadioListTile(
                                        groupValue: settings.autoDarkTheme,
                                        onChanged: (value) {
                                          settings.autoDarkTheme = value;
                                          Navigator.of(context).pop();
                                        },
                                        value: 0,
                                        title: Text("Wyłączony"),
                                      ),
                                      RadioListTile(
                                        groupValue: settings.autoDarkTheme,
                                        onChanged: (value) {
                                          settings.autoDarkTheme = value;
                                          Navigator.of(context).pop();
                                        },
                                        value: 1,
                                        title: Text(
                                            "Od zachodu do wschodu słońca"),
                                      ),
                                      RadioListTile(
                                        groupValue: settings.autoDarkTheme,
                                        onChanged: (value) {
                                          settings.autoDarkTheme = value;
                                          Navigator.of(context).pop();
                                        },
                                        value: 2,
                                        title: Text("W określonych godzinach"),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(height: 18.0),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Visibility(
                  visible: settings.autoDarkTheme == 2,
                  child: OWMSettingListener(
                    rebuildOnChange: (settings) =>
                        settings.autoDarkThemeTimeFromStream,
                    builder: (context, settings) {
                      return ListTile(
                        title: Text("Od"),
                        subtitle: Text(settings.autoDarkThemeTimeFrom),
                        onTap: () async {
                          TimeOfDay response = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(
                                  hour: int.parse(settings.autoDarkThemeTimeFrom
                                      .split(":")[0]),
                                  minute: int.parse(settings
                                      .autoDarkThemeTimeFrom
                                      .split(":")[1])));
                          if (response != null &&
                              response.toString() !=
                                  settings.autoDarkThemeTimeFrom) {
                            settings.autoDarkThemeTimeFrom =
                                response.toString().substring(10, 15);
                          }
                        },
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: settings.autoDarkTheme == 2,
                  child: OWMSettingListener(
                    rebuildOnChange: (settings) =>
                        settings.autoDarkThemeTimeToStream,
                    builder: (context, settings) {
                      return ListTile(
                        title: Text("Do"),
                        subtitle: Text(settings.autoDarkThemeTimeTo),
                        onTap: () async {
                          TimeOfDay response = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(
                                  hour: int.parse(settings.autoDarkThemeTimeTo
                                      .split(":")[0]),
                                  minute: int.parse(settings.autoDarkThemeTimeTo
                                      .split(":")[1])));
                          if (response != null &&
                              response.toString() !=
                                  settings.autoDarkThemeTimeTo) {
                            settings.autoDarkThemeTimeTo =
                                response.toString().substring(10, 15);
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
        DividerWidget(),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.simpleLinkViewStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.simpleLinkView,
              title: Text("Prosta lista znalezisk"),
              onChanged: (value) =>
                  settings.simpleLinkView = !settings.simpleLinkView,
            );
          },
        ),
        DividerWidget(),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.accentColorStream,
          builder: (context, settings) {
            return ListTile(
              title: Text("Kolor akcentu"),
              trailing: CircleColor(
                  circleSize: 30, color: Color(settings.accentColor)),
              subtitle: Text("Wybierz kolor akcentu aplikacji"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "Wybierz kolor akcentu",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 220,
                            child: OWMSettingListener(
                              rebuildOnChange: (settings) =>
                                  settings.accentColorStream,
                              builder: (context, settings) {
                                return MaterialColorPicker(
                                  onMainColorChange: (Color color) {
                                    settings.accentColor = color.value;
                                    Navigator.of(context).pop();
                                  },
                                  allowShades: false,
                                  selectedColor: Color(settings.accentColor),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 18.0),
                        ],
                      ),
                    ),
                  
                );
              },
            );
          },
        ),
      ],
    );
  }

  String _autoDarkThemeSubtitle(int i) {
    if (i == 1) {
      return "Od zachodu do wschodu słońca";
    } else if (i == 2) {
      return "W określonych godzinach";
    } else {
      return "Wyłączony";
    }
  }
}
