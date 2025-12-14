import 'dart:convert';

import '../../../../../core/constants/app.dart';
import '../../../../../core/utils/helper/method_utils.dart';
import '../../../../../features/{{feature_name}}/data/models/{{feature_name}}_model.dart';
import 'package:http/http.dart' as http;

abstract interface class {{feature_name}}RemoteDataSource {
  Future<List<{{feature_name}}Model>> get{{feature_name}}s({
    required String token,
    int page = 1,
  });

  Future<void> get{{feature_name}}({required String id, required String token});


  Future<void> create{{feature_name}}({
    required {{feature_name}}Model {{feature_name.camelCase()}},
    required String token,
  });

  Future<void> update{{feature_name}}({
    required {{feature_name}}Model {{feature_name.camelCase()}},
    required String token,
  });

  Future<void> delete{{feature_name}}({required String id, required String token});
}

class {{feature_name}}RemoteDataSourceImpl implements {{feature_name}}RemoteDataSource {
  final http.Client _client;

{{feature_name}}RemoteDataSourceImpl(this._client);

  @override
  Future<List<{{feature_name}}Model>> get{{feature_name}}s({
    required String token,
    int page = 1,
  }) async {
    final response = await _client.get(
      Uri.parse(
        '$baseUrlV2/{{feature_name.camelCase()}}:list',
      ).replace(queryParameters: {'page': page.toString()}),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    throwServerException(response, 200);
    final data = jsonDecode(response.body)['data'];
    return data
        .map<{{feature_name}}Model>(
          (json) => {{feature_name}}Model.fromJson(json as Map<String, dynamic>),
    )
        .toList();
  }

  @override
  Future<{{feature_name}}Model> get{{feature_name}}({required String id, required String token}) async {
    final response = await _client.get(
      Uri.parse(
        '$baseUrlV2/{{feature_name.camelCase()}}:get',
      ).replace(queryParameters: {'filterByTk': id.toString()}),
      headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'},
    );
    throwServerException(response, 200);
    final data = jsonDecode(response.body)['data'];
    return {{feature_name}}Model.fromJson(data);
}

  @override
  Future<void> create{{feature_name}}({
    required {{feature_name}}Model {{feature_name.camelCase()}},
    required String token,
  }) async {
    final response = await _client.post(
      Uri.parse('$baseUrlV2/{{feature_name.camelCase()}}:create'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({{feature_name.camelCase()}}.toJsonForCreate()),
    );
    throwServerException(response, 200);
  }

  @override
  Future<void> update{{feature_name}}({
    required {{feature_name}}Model {{feature_name.camelCase()}},
    required String token,
  }) async {
    final response = await _client.post(
      Uri.parse(
        '$baseUrlV2/{{feature_name.camelCase()}}:update',
      ).replace(queryParameters: {'filterByTk': {{feature_name.camelCase()}}.id}),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({{feature_name.camelCase()}}.toJsonForCreate()),
    );
    throwServerException(response, 200);
  }

  @override
  Future<void> delete{{feature_name}}({
    required String id,
    required String token,
  }) async {
    final response = await _client.post(
      Uri.parse(
        '$baseUrlV2/{{feature_name.camelCase()}}:destroy',
      ).replace(queryParameters: {'filterByTk': id}),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    throwServerException(response, 200);
  }
}
