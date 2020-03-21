import 'dart:core';

import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/api/api.dart' as prefix0;
import 'package:owmflutter/models/entry_link.dart';
import 'package:owmflutter/models/link.dart';
import 'package:owmflutter/models/link_comment.dart';
import 'package:owmflutter/models/models.dart';

class ProfilesApi extends ApiResource {
  ProfilesApi(ApiClient client) : super(client);

  Future<List<EntryLink>> getActions(String username) async {
    var items = await client
        .request('profiles', 'actions', api: [username], named: {'page': '1'});
    return deserializeEntryLinks(items);
  }

  Future<List<Link>> getAddedLinks(int page, String username) async {
    var items = await client.request('profiles', 'added',
        api: [username], named: {'page': page.toString()});
    return deserializeLinks(items);
  }

  Future<List<Link>> getCommentedLinks(int page, String username) async {
    var items = await client.request('profiles', 'commented',
        api: [username], named: {'page': page.toString()});
    return deserializeLinks(items);
  }

  Future<List<Link>> getPublishedLinks(int page, String username) async {
    var items = await client.request('profiles', 'published',
        api: [username], named: {'page': page.toString()});
    return deserializeLinks(items);
  }

  Future<List<LinkComment>> getLinkComments(int page, String username) async {
    var items = await client.request('profiles', 'comments',
        api: [username], named: {'page': page.toString()});
    return deserializeLinkComments(items);
  }

  Future<List<Entry>> getEntries(int page, String username) async {
    var items = await client.request('profiles', 'entries',
        api: [username], named: {'page': page.toString()});
    return deserializeEntries(items);
  }

  Future<List<Entry>> getCommentedEntries(int page, String username) async {
    var items = await client.request('profiles', 'commentedentries',
        api: [username], named: {'page': page.toString()});
    return deserializeEntries(items);
  }

  Future<List<EntryComment>> getEntryComments(int page, String username) async {
    var items = await client.request('profiles', 'entriescomments',
        api: [username], named: {'page': page.toString()});
    return deserializeEntryComments(items);
  }

  Future<List<LinkComment>> getFollowers(int page, String username) async {
    var items = await client.request('profiles', 'followers',
        api: [username], named: {'page': page.toString()});
    return deserializeLinkComments(items);
  }

  Future<List<LinkComment>> getFollowed(int page, String username) async {
    var items = await client.request('profiles', 'followed',
        api: [username], named: {'page': page.toString()});
    return deserializeLinkComments(items);
  }

  Future<List<ProfileRelated>> getProfileRelated(int page, String username) async {
    var items = await client.request('profiles', 'related',
        api: [username], named: {'page': page.toString()});
        print(items);
    return deserializeProfileRelated(items);
  }

  Future<ProfileResponse> getProfile(String username) async {
    var items = await client.request('profiles', 'index', api: [username]);
    print(items);
    return deserializeProfile(items);
  }

  Future<List<Link>> getDigged(int page, String username) async {
    var items = await client.request('profiles', 'digged',
        api: [username], named: {'page': page.toString()});
    return deserializeLinks(items);
  }

  Future<List<Link>> getBuried(int page, String username) async {
    var items = await client.request('profiles', 'buried',
        api: [username], named: {'page': page.toString()});
    return deserializeLinks(items);
  }

  Future<bool> observe(String username) async {
    var items = await client.request('profiles', 'observe', api: [username]);
    return items["is_observed"];
  }

  Future<bool> unobserve(String username) async {
    var items = await client.request('profiles', 'unobserve', api: [username]);
    return items["is_observed"];
  }

  Future<bool> block(String username) async {
    var items = await client.request('profiles', 'block', api: [username]);
    return items["is_blocked"];
  }

  Future<bool> unblock(String username) async {
    var items = await client.request('profiles', 'unblock', api: [username]);
    return items["is_blocked"];
  }
}
