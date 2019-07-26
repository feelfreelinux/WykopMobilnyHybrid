import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';

class TagsApi extends ApiResource {
  TagsApi(ApiClient client) : super(client);

  Future<List<EntryLink>> getIndex(String tag, int page) async {
    var items = await client
        .request('tags', 'index', api: [tag], named: {'page': page.toString()});
    return deserializeEntryLinks(items);
  }

  Future<List<Link>> getLinks(String tag, int page) async {
    var items = await client
        .request('tags', 'links', api: [tag], named: {'page': page.toString()});

    return deserializeLinks(items);
  }

  Future<List<Entry>> getEntries(String tag, int page) async {
    var items = await client.request('tags', 'entries',
        api: [tag], named: {'page': page.toString()});
    debugPrint(items);

    return deserializeEntries(items);
  }
}
