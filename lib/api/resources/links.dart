import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';

class LinksApi extends ApiResource {
  LinksApi(ApiClient client) : super(client);

  Future<Result> getPromoted(int page) async {
    var items = await client
        .request('links', 'promoted', named: {'page': page.toString()});
    return normalizeLinksResponse(
        BuiltList.from(client.deserializeList(LinkResponse.serializer, items)));
  }

  Future<Result> getLink(int linkId) async {
    var items = await client.request('links', 'link', api: [linkId.toString()]);
    return normalizeLinkResponse(
        client.deserializeElement(LinkResponse.serializer, items));
  }

  Future<Result> getLinkComments(int linkId) async {
    var items =
        await client.request('links', 'comments', api: [linkId.toString()]);
    return normalizeLinkCommentsResponse(BuiltList.from(
        client.deserializeList(LinkCommentResponse.serializer, items)));
  }
}
