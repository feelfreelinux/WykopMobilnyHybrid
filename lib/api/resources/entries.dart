import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';

class EntriesApi extends ApiResource {
  EntriesApi(ApiClient client) : super(client);

  Future<Result> getHot(int page, String period) async {
    var items = await client.request('entries', 'hot',
        named: {'period': period, 'page': page.toString()});
    return normalizeEntries(BuiltList.from(
        client.deserializeList(EntryResponse.serializer, items)));
  }

  Future<Result> getNewest(int page) async {
    var items = await client
        .request('entries', 'stream', named: {'page': page.toString()});
    return normalizeEntries(BuiltList.from(
        client.deserializeList(EntryResponse.serializer, items)));
  }

  Future<Result> getActive(int page) async {
    var items = await client
        .request('entries', 'active', named: {'page': page.toString()});
    return normalizeEntries(BuiltList.from(
        client.deserializeList(EntryResponse.serializer, items)));
  }

  Future<Result> getEntry(int id) async {
    var items = await client.request('entries', 'entry', api: [id.toString()]);
    return normalizeEntry(
        client.deserializeElement(EntryResponse.serializer, items));
  }
}
