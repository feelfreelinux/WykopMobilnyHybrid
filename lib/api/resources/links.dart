import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';

class LinksApi extends ApiResource {
  LinksApi(ApiClient client) : super(client);

  Future<Result> getPromoted(int page) async {
    var items = await client
        .request('links', 'promoted', named: {'page': page.toString()});
    return normalizeLinks(
        BuiltList.from(client.deserializeList(LinkResponse.serializer, items)));
  }
}
