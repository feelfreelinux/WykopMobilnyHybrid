export 'response_models/entry_response.dart';
export 'response_models/author_response.dart';
export 'response_models/embed_response.dart';
export 'response_models/entry_comment_response.dart';
export 'response_models/serializers.dart';
export 'normalizers.dart';

import 'dart:async';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:http/http.dart' as http;
import 'dart:io';

/*
 * Handles request signing, retrying, deserializing, saving auth tokens,
 * logging in and all sort of things 
 */
class ApiClient extends http.BaseClient {
  final http.Client _inner = http.Client();

  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    var toSign = _secrets.secret + request.url.toString();

    if (request is http.MultipartRequest) {
      toSign = _secrets.secret +
          request.url.toString() +
          request.fields.values.join(',');
    }

    print(toSign);
    request.headers['apisign'] = generateMd5(toSign);
    request.headers['User-Agent'] = 'OWMHYBRID';

    http.StreamedResponse response = await _inner.send(request);

    if (response != null && response.statusCode == 401) {
      var authResponse = await this.request('login', 'index',
          post: {'login': credentials.login, 'accountkey': credentials.token});

      var originalPath = request.url.toString();

      originalPath =
          originalPath.substring(0, originalPath.indexOf("/userkey/")) +
              "/userkey/" +
              authResponse["userkey"];
      print(originalPath);

      this.credentials.refreshToken = authResponse["userkey"];
      await saveAuthCreds(this.credentials);
      if (request is http.MultipartRequest) {
        var newRequest =
            http.MultipartRequest(request.method, Uri.parse(originalPath));
        request.fields.forEach((key, value) => newRequest.fields[key] = value);
        return await send(
            http.Request(request.method, Uri.parse(originalPath)));
      }
      return await send(http.Request(request.method, Uri.parse(originalPath)));
    }
    return response;
  }

  void close() => _inner.close();

  ApiSecrets _secrets;
  AuthCredentials credentials;
  get secrets => _secrets;
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
  Future<void> logoutUser() async {
    await saveAuthCreds(AuthCredentials());
    this.credentials = await loadAuthCreds();
    this.checkedCreds = true;
  }
  void initialize() {
    loadSecrets().then((keys) => this._secrets = keys);
  }

  Future<dynamic> request(String endpoint, String resource,
      {List<String> api: const [],
      Map<String, String> named: const {},
      Map<String, String> post: const {'owm-get': 'yes'},
      File image}) async {
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

    if (api.isNotEmpty && named.isEmpty) {
      path += '/';
    }

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

    http.Response response;
    if (post.containsKey('owm-get')) {
      response = await get("https://a2.wykop.pl" + path);
    } else {
      var multipartRequest = http.MultipartRequest(
          "POST", Uri.parse("https://a2.wykop.pl" + path));
      post.forEach((key, value) => multipartRequest.fields[key] = value);
      if (image != null) {
        multipartRequest.files.add(await http.MultipartFile.fromPath("embed", image.path));
      }
      response = await http.Response.fromStream(await send(multipartRequest));
    }

    return json.decode(response.body)["data"];
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
  final String backgroundUrl;
  final int color;
  String refreshToken;
  AuthCredentials({this.token, this.avatarUrl, this.login, this.refreshToken, this.color, this.backgroundUrl});
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

Future<void> saveAuthCreds(AuthCredentials credentials) async {
  var prefs = await SharedPreferences.getInstance();
  await prefs.setString('userkey', credentials.refreshToken ?? "");
  await prefs.setString('accountkey', credentials.token ?? "");
  await prefs.setString('login', credentials.login ?? "");
  await prefs.setString('avatarUrl', credentials.avatarUrl ?? "");
  await prefs.setString('backgroundUrl', credentials.backgroundUrl ?? "");
  await prefs.setInt('color', credentials.color ?? 0);

  return;
}

Future<AuthCredentials> loadAuthCreds() async {
  var prefs = await SharedPreferences.getInstance();
  var creds = AuthCredentials(
      refreshToken: prefs.getString('userkey'),
      token: prefs.getString('accountkey'),
      login: prefs.getString('login'),
      backgroundUrl: prefs.getString('backgroundUrl'),
      color: prefs.getInt('color'),
      avatarUrl: prefs.getString('avatarUrl'));
  return creds;
}
