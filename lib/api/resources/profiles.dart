import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/api/api.dart' as prefix0;
import 'package:owmflutter/models/entry_link.dart';

class ProfilesApi extends ApiResource {
  ProfilesApi(ApiClient client) : super(client);

  Future<List<EntryLink>> getActions(String username) async {
    var items = await client
        .request('profiles', 'actions', api: [username], named: {'page': '1'});
    return deserializeEntryLinks(items);
  }

  Future<ProfileResponse> getProfile(String username) async {
    var items = await client.request('profiles', 'index', api: [username]);
    print(items);
    return deserializeProfile(items);
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
