import 'package:flutter/material.dart';
import 'wykop_url_parsers.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:owmflutter/utils/utils.dart';

class WykopNavigator {
  static const PROFILE_PREFIX = "@";
  static const TAG_PREFIX = "#";
  static const ENTRY_MATCHER = "wpis";
  static const LINK_MATCHER = "link";
  static const TAG_MATCHER = "tag";
  static const PM_MATCHER = "wiadomosc-prywatna";
  static const DELIMITER = "/";

  static Widget getWidgetForUrl(String url) {
    var domain = Uri.parse(url).host.replaceAll("www.", "");
    print(domain);
    switch (domain) {
      case "wykop.pl":
        var resource = url.split("wykop.pl/")[1];
        switch (resource.split(DELIMITER)[0]) {
          case ENTRY_MATCHER:
            var id = getEntryId(url);
            return EntryScreen(entryId: id);
            break;
          case TAG_MATCHER:
            var tag = getTag(url);
            return TagScreen(tag: tag);
            break;
          default:
            return null;
        }
    }
    return null;
  }

  static handleUrl(BuildContext context, String url) async {
    try {
      var widget = getWidgetForUrl(url);
      if (widget == null) {
        throw (Exception("Cannot parse url"));
      }

      Navigator.of(context).push(Utils.getPageTransition(widget));
    } catch (e) {
      if (await canLaunch(url)) {
        launch(url);
      }
    }
  }
}
