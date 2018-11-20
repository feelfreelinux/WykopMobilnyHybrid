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
import 'package:owmflutter/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

class AuthCredentials {
  final String token;
  final String login;
  final String avatarUrl;
  String refreshToken;
  AuthCredentials({this.token, this.avatarUrl, this.login, this.refreshToken});
}

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

class ApiClient {
  ApiSecrets _secrets;
  AuthCredentials credentials;
  var _dio = new Dio(Options(
    baseUrl: "https://a2.wykop.pl",
    connectTimeout: 5000,
    receiveTimeout: 5000,
  ));
  var checkedCreds = false;

  Future<void> syncCredsFromStorage() async {
    if (!checkedCreds) {
      try {
        this.credentials = await loadAuthCreds();
      } catch (e) {
        // Not logged in yet
      }
      this.checkedCreds = true;
    }
  }

  ApiClient() {}

  void initialize() {
    loadSecrets().then((keys) => this._secrets = keys);

    // Signing interceptor
    _dio.interceptor.request.onSend = (Options options) async {
      var toSign = _secrets.secret + "https://a2.wykop.pl" + options.path;
      if (options.method == "POST") {
        toSign += (options.data).values.join(',');
        print(options.data);
      }

      print(toSign);
      options.headers['apisign'] = generateMd5(toSign);
      options.headers['User-Agent'] = 'OWMHYBRID';
      return options;
    };

    _dio.interceptor.response.onError = (DioError error) async {
      if (error.response.statusCode == 401) {
        var authResponse = await this.request('login', 'index', post: {
          'login': credentials.login,
          'accountkey': credentials.token
        });
        this.credentials.refreshToken = authResponse["userkey"];
        return await _dio.request(error.response.request.path,
            options: error.response.request);
      }

      return error;
    };
  }

  Future<dynamic> request(String endpoint, String resource,
      {List<String> api: const [],
      Map<String, String> named: const {},
      Map<String, String> post: const {'owm-get': 'yes'}}) async {
    if (this._secrets == null) {
      this._secrets = await loadSecrets();
    }
    await this.syncCredsFromStorage();

    var path = '/' + endpoint + '/' + resource;
    if (api.isEmpty && named.isEmpty) {
      path += '/';
    }

    if (api.isNotEmpty) {
      path += '/';
    }

    path += api.join('/');

    if (named.isNotEmpty) {
      path += '/';
    }

    named.forEach((key, value) {
      path += key + '/' + value + '/';
    });
    path += 'appkey/' + this._secrets.appkey;
    if (credentials != null && credentials.refreshToken != null) {
      path += '/userkey/' + credentials.refreshToken;
    }

    Response response;
    if (post.containsKey('owm-get')) {
      response = await _dio.get(path);
    } else {
      response = await _dio.post(path,
          data: (post),
          options: new Options(
              contentType:
                  ContentType.parse("application/x-www-form-urlencoded")));
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

  AuthCredentials get credentials => _client.credentials;

  void setUserToken(AuthCredentials credentials) {
    _client.credentials = credentials;
  }

  Future<void> ensureSynced() async {
    await this._client.syncCredsFromStorage();
  }

  WykopApiClient() {
    _client.initialize();
  }

  Future<Result> getHot(int page, String period) async {
    var items = await _client.request('entries', 'hot',
        named: {'period': period, 'page': page.toString()});
    return normalizeEntries(BuiltList.from(
        _client.deserializeList(EntryResponse.serializer, items)));
  }

  Future<Result> getNewest(int page) async {
    var items = await _client
        .request('entries', 'stream', named: {'page': page.toString()});
    return normalizeEntries(BuiltList.from(
        _client.deserializeList(EntryResponse.serializer, items)));
  }

  Future<Result> getActive(int page) async {
    var items = await _client
        .request('entries', 'active', named: {'page': page.toString()});
    return normalizeEntries(BuiltList.from(
        _client.deserializeList(EntryResponse.serializer, items)));
  }

  Future<Result> getEntry(int id) async {
    var items = await _client.request('entries', 'entry', api: [id.toString()]);
    return normalizeEntry(
        _client.deserializeElement(EntryResponse.serializer, items));
  }

  Future<UserProfile> login(String login, String accountKey) async {
    var result = await _client.request('login', 'index',
        post: {'login': login, 'accountkey': accountKey});

    var credentials = AuthCredentials(
        avatarUrl: result["profile"]["avatar"],
        login: login,
        token: accountKey,
        refreshToken: result["userkey"]);
    await saveAuthCreds(credentials);
    _client.credentials = credentials;

    return UserProfile(avatarUrl: result["profile"]["avatar"], login: login);
  }
}

var api = WykopApiClient();

Future<void> saveAuthCreds(AuthCredentials credentials) async {
  var prefs = await SharedPreferences.getInstance();
  await prefs.setString('userkey', credentials.refreshToken);
  await prefs.setString('accountkey', credentials.token);
  await prefs.setString('login', credentials.login);
  await prefs.setString('avatarUrl', credentials.avatarUrl);
  return;
}

Future<AuthCredentials> loadAuthCreds() async {
  var prefs = await SharedPreferences.getInstance();
  var creds = AuthCredentials(
      refreshToken: prefs.getString('userkey'),
      token: prefs.getString('accountkey'),
      login: prefs.getString('login'),
      avatarUrl: prefs.getString('avatarUrl'));
  return creds;
}
