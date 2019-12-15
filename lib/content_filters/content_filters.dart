import 'package:flutter/widgets.dart';
import 'package:owmflutter/app.dart';
import 'package:owmflutter/content_filters/filters/contains_tags_filter.dart';
import 'package:owmflutter/content_filters/filters/filter.dart';
import 'package:owmflutter/content_filters/filters/user_group_filter.dart';
import 'package:owmflutter/models/entry.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/owm_settings.dart';
import 'package:provider/provider.dart';

final List<MultiTypeContentFilter> filters = [
  EntryContainsTagsFilter(),
  ExcludeNewbieContentFilter(),
];

List<MultiTypeContentFilter> getEnabledFilters(
    BuildContext context, OWMSettings settings) {
  return filters.where((e) => e.shouldEnable(context, settings)).toList();
}

class OWMContentFilter {
  static final List<MultiTypeContentFilter> filters = [
    EntryContainsTagsFilter(),
    ExcludeNewbieContentFilter(),
  ];

  static List<MultiTypeContentFilter> getEnabledFilters(
      BuildContext context, OWMSettings settings) {
    return filters.where((e) => e.shouldEnable(context, settings)).toList();
  }

  static Entry performFilterOnEntry(
      Entry entry, BuildContext context, OWMSettings settings) {
    return entry.rebuild(
      (b) => b
        ..isExpanded = getEnabledFilters(context, settings).every(
          (e) => e.performFilterOnEntry(entry),
        ),
    );
  }

  static EntryLink performFilterOnEntryLink(
      EntryLink entry, BuildContext context, OWMSettings settings) {
    return entry.rebuild(
      (b) => b
        ..isExpanded = getEnabledFilters(context, settings).every(
          (e) => e.performFilterOnEntryLink(entry),
        ),
    );
  }

  static Link performFilterOnLink(
      Link entry, BuildContext context, OWMSettings settings) {
    return entry.rebuild(
      (b) => b
        ..isExpanded = getEnabledFilters(context, settings).every(
          (e) => e.performFilterOnLink(entry),
        ),
    );
  }

  static LinkComment performFilterOnLinkComment(
      LinkComment entry, BuildContext context, OWMSettings settings) {
    return entry.rebuild(
      (b) => b
        ..isExpanded = getEnabledFilters(context, settings).every(
          (e) => e.performFilterOnLinkComment(entry),
        ),
    );
  }

  static EntryComment performFilterOnEntryComment(
      EntryComment entry, BuildContext context, OWMSettings settings) {
    return entry.rebuild(
      (b) => b
        ..isExpanded = getEnabledFilters(context, settings).every(
          (e) => e.performFilterOnEntryComment(entry),
        ),
    );
  }

  static Future<List<Entry>> filterEntries(
      Future<List<Entry>> future, BuildContext context) async {
    return (await future)
        .map((e) => performFilterOnEntry(e, context, owmSettings))
        .toList();
  }

  static Future<List<Link>> filterLinks(
      Future<List<Link>> future, BuildContext context) async {
    return (await future)
        .map((e) => performFilterOnLink(e, context, owmSettings))
        .toList();
  }

  static Future<List<EntryLink>> filterEntryLinks(
      Future<List<EntryLink>> future, BuildContext context) async {
    return (await future)
        .map((e) => performFilterOnEntryLink(e, context, owmSettings))
        .toList();
  }

  static Future<List<EntryComment>> filterEntryComments(
      Future<List<EntryComment>> future, BuildContext context) async {
    return (await future)
        .map((e) => performFilterOnEntryComment(e, context, owmSettings))
        .toList();
  }

  static Future<List<LinkComment>> filterLinkComments(
      Future<List<LinkComment>> future, BuildContext context) async {
    return (await future)
        .map((e) => performFilterOnLinkComment(e, context, owmSettings))
        .toList();
  }
}

class EntryContentFilter extends ContentFilter<Entry> {
  @override
  Entry filter(Entry item, BuildContext context, OWMSettings settings) {
    return item.rebuild(
      (b) => b
        ..isExpanded = getEnabledFilters(context, settings).every(
          (e) => e.performFilterOnEntry(item),
        ),
    );
  }

  @override
  Future<List<Entry>> filterFutureList(Future<List<Entry>> future, BuildContext context) async {

    return (await future)
        .map((e) => this.filter(e, context, owmSettings))
        .toList();
  }
}

abstract class ContentFilter<T> {
  Future<List<T>> filterFutureList(Future<List<T>> future, BuildContext context);
  T filter(T item, BuildContext context, OWMSettings settings);
}
