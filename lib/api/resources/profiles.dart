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
    var items = await client
        .request('profiles', 'index', api: [username]);
    return deserializeProfile(items);
  }
}
