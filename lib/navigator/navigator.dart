import 'package:flutter/material.dart';
import 'package:owmflutter/widgets/author_relation_builder.dart';
import 'wykop_url_parsers.dart';
import 'package:owmflutter/screens/screens.dart';
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
    debugPrint(domain);
    switch (domain) {
      case "wykop.pl":
        var resource = url.split("wykop.pl/")[1];
        print(resource.split(DELIMITER)[0]);
        switch (resource.split(DELIMITER)[0]) {
          case ENTRY_MATCHER:
            var id = getEntryId(url);
            return HighlightWrapper(
              id: getHighlightCommentId(url),
              child: EntryScreen(entryId: id),
            );
            break;
          case LINK_MATCHER:
            var id = getLinkUrl(url);
            return HighlightWrapper(
              id: getHighlightCommentId(url),
              child: LinkScreen(linkId: id),
            );
            break;
          case TAG_MATCHER:
            var tag = getTag(url);
            return TagScreen(tag: tag);
            break;
          case PM_MATCHER:
            var profile = getConversation(url);
            return PmScreen(receiver: profile);
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
      launchUrl(url, context: context);
    }
  }
}
