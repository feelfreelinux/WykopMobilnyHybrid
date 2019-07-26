import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';

class ProfilesApi extends ApiResource {
  ProfilesApi(ApiClient client) : super(client);

/*  Future<Result> getActions(String username) async {
    var items = await client
        .request('profiles', 'actions', api: [username], named: {'page': '1'});
    return normalizeEntryLinkResponse(BuiltList.from(
        client.deserializeList(EntryLinkResponse.serializer, items)));
  }*/
}
