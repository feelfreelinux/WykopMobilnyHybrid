import 'package:flutter/cupertino.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/utils.dart';

abstract class ContentFilter<T> {
  Future<void> setup(BuildContext context, OWMSettings settings);
  Future<bool> performFilter<T>();
}

abstract class MultiTypeContentFilter {
  bool shouldEnable(BuildContext context, OWMSettings settings);
  
  bool performFilterOnLink(Link entry) => true;
  bool performFilterOnEntry(Entry entry) => true;
  bool performFilterOnEntryLink(EntryLink entry) => true;
  bool performFilterOnEntryComment(EntryComment entryComment) => true;
  bool performFilterOnLinkComment(LinkComment entry) => true;

}