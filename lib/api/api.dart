export 'response_models/entry_response.dart';
export 'response_models/author_response.dart';
export 'response_models/embed_response.dart';
export 'response_models/entry_comment_response.dart';
export 'response_models/serializers.dart';
export 'normalizers.dart';
export 'client.dart';
export 'resources/api_resource.dart';
export 'resources/entries.dart';
export 'resources/users.dart';

import 'dart:async';
import 'package:owmflutter/api/client.dart';
import 'package:owmflutter/api/api.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

String generateMd5(String data) {
  var content = Utf8Encoder().convert(data);
  var md5 = crypto.md5;
  var digest = md5.convert(content);

  return hex.encode(digest.bytes);
}

class WykopApiClient {
  final ApiClient _client = ApiClient();

  String getAppKey() => _client.secrets.appkey;
  String getAppSecret() => _client.secrets.secret;

  EntriesApi entries;
  UsersApi users;

  AuthCredentials get credentials => _client.credentials;

  void setUserToken(AuthCredentials credentials) {
    _client.credentials = credentials;
  }

  Future<void> ensureSynced() async {
    await this._client.syncCredsFromStorage();
  }

  WykopApiClient() {
    _client.initialize();
    this.entries = EntriesApi(_client);
    this.users = UsersApi(_client);
  }
}

var api = WykopApiClient();
