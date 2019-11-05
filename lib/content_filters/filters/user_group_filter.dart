import 'package:flutter/widgets.dart';
import 'package:owmflutter/content_filters/filters/filter.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/utils.dart';

class ExcludeNewbieContentFilter extends MultiTypeContentFilter {
  @override
  bool shouldEnable(BuildContext context, OWMSettings settings) {
    return settings.expandNewbieContent;
  }

  @override
  bool performFilterOnEntry(Entry entry) {
    return verifyAuthor(entry.author);
  }

  @override
  bool performFilterOnEntryLink(EntryLink entryLink) {
    return verifyAuthor(entryLink.hasEntry ? entryLink.entry.author : entryLink.link.author);
  }

  @override
  bool performFilterOnLink(Link link) {
    return verifyAuthor(link.author);
  }

  @override
  bool performFilterOnLinkComment(LinkComment comment) {
    return verifyAuthor(comment.author);
  }  
  
  @override
  bool performFilterOnEntryComment(EntryComment comment) {
    return verifyAuthor(comment.author);
  }
  bool verifyAuthor(Author author) => author.color != 0;
}