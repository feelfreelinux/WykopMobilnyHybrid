import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

///
/// EmbedApi handles getting direct media url from various streaming
/// services (Gfycat, Coub, Streamable).
///
class EmbedApi extends ApiResource {
  EmbedApi(ApiClient client) : super(client);

  Future<String> getGfycatUrl(String url) async {
    var gfycatItem = url
        .replaceAll(".gif", "")
        .replaceAll(".mp4", "")
        .replaceAll(".webm", "")
        .replaceAll("-size_restricted", "")
        .split("/");

    var gfyId = gfycatItem[
        url.endsWith('/') ? gfycatItem.length - 2 : gfycatItem.length - 1];
    var data = await http.get('https://api.gfycat.com/v1/gfycats/' + gfyId);
    return json.decode(data.body)["gfyItem"]["webmUrl"];
  }

  // TODO: Implement coub (base64 decoding, separate audio track)
  // Sample api request: https://coub.com/api/v2/coubs/w1nz6
  Future<String> getCoubUrl(String url) async {
    return '';
  }

  Future<String> getStreamableUrl(String url) async {
    var streamableItems = url.split("/");

    var streamableId = streamableItems[url.endsWith('/')
        ? streamableItems.length - 2
        : streamableItems.length - 1];
    var data =
        await http.get('https://api.streamable.com/videos/' + streamableId);
    var files = json.decode(data.body)["files"];
    return "https:${files["mp4-mobile"]["url"] ?? files["mp4"]["url"]}";
  }
}
