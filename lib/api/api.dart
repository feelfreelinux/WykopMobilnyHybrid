export 'response_models/entry_response.dart';
export 'response_models/author_response.dart';
export 'response_models/embed_response.dart';
export 'response_models/entry_comment_response.dart';
export 'response_models/serializers.dart';
export 'normalizers.dart';

import 'dart:async';
import 'package:built_value/serializer.dart';
import 'dart:io';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/api/api.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:dio/dio.dart';

String generateMd5(String data) {
  var content = Utf8Encoder().convert(data);
  var md5 = crypto.md5;
  var digest = md5.convert(content);

  return hex.encode(digest.bytes);
}

class ApiClient {
  ApiSecrets _secrets;
  var _dio = new Dio(Options(
    baseUrl: "https://a2.wykop.pl",
    connectTimeout: 5000,
    receiveTimeout: 5000,
  ));

  ApiClient () {}

  void initialize() {
    loadSecrets().then((keys) => this._secrets = keys);

    // Signing interceptor
    _dio.interceptor.request.onSend = (Options options) async {
      var toSign = _secrets.secret + "https://a2.wykop.pl" + options.path;
      if (options.method == "POST") {
        toSign += (options.data).values.join(',');
        print (options.data);
      }

      options.headers['apisign'] = generateMd5(toSign);
      options.headers['User-Agent'] = 'OWMHYBRID';
      return options;
    };

    _dio.interceptor.response.onError = (DioError error) {
      print(error.response.data);
      return error;
    };
  }

    Future<dynamic> request(String endpoint,
      String resource,
      { List<String> api: const [],
      Map<String, String> named: const {},
      Map<String, String> post: const { 'owm-get': 'yes'}}) async {
        if (this._secrets == null) {
          this._secrets = await loadSecrets();
          print(this._secrets);
        }

        var path = '/' + endpoint + '/' + resource + '/';
        path += api.join('/');
        named.forEach((key, value) {
          path += key + '/' + value;
        });
        path += '/appkey/' + this._secrets.appkey;

        Response response;
        if (post.containsKey('owm-get')) {
          response = await _dio.get(path);
        } else {
          response = await _dio.post(path, data: (post), options: new Options(contentType: ContentType.parse("application/x-www-form-urlencoded")));
        }

        return response.data["data"];
  }

  List<T> deserializeList<T>(Serializer<T> serializer, map) {
    var list = List<dynamic>.from(map);
    return list.map((el) {
      return serializers.deserializeWith(serializer, el);
    }).toList();
  }

  T deserializeElement<T>(Serializer<T> serializer, map) {
    return serializers.deserializeWith(serializer, (map));
  }
}

class WykopApiClient {
  final ApiClient _client = ApiClient();

  String getAppKey() => _client._secrets.appkey;
  String getAppSecret() => _client._secrets.secret;

  WykopApiClient() {
    _client.initialize();
  }

  Future<Result> getHot(int page, String period) async {
    var items = await _client.request('entries', 'hot', named: { 'period': period, 'page': page.toString() });
    return normalizeEntries(BuiltList.from(_client.deserializeList(EntryResponse.serializer, items)));
  }

  Future<Result> getNewest(int page) async {
    var items = await _client.request('entries', 'stream', named: { 'page': page.toString() });
    return normalizeEntries(BuiltList.from(_client.deserializeList(EntryResponse.serializer, items)));
  }

  Future<Result> getActive(int page) async {
    var items = await _client.request('entries', 'active', named: { 'page': page.toString() });
    return normalizeEntries(BuiltList.from(_client.deserializeList(EntryResponse.serializer, items)));
  }

  Future<Result> getEntry(int id) async {
    var items = await _client.request('entries', 'entry', api: [id.toString()]);
    return normalizeEntry(_client.deserializeElement(EntryResponse.serializer, items));
  }
}

var api = WykopApiClient();

class ApiSecrets {
  final String secret;
  final String appkey;
  ApiSecrets({this.secret, this.appkey});
}

Future<ApiSecrets> loadSecrets() async {
  var rawJson = await rootBundle.loadString('assets/secrets.json');
  var decoded = json.decode(rawJson);
  return ApiSecrets(
      appkey: decoded["wykop_key"], secret: decoded["wykop_secret"]);
}