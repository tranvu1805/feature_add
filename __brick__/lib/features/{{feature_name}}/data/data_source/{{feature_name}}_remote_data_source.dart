import 'dart:convert';

import 'package:{{project_name.snakeCase()}}/core/constants/app.dart';
import 'package:{{project_name.snakeCase()}}/core/utils/helper/method_utils.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/data/data.dart';
import 'package:http/http.dart' as http;

abstract interface class {{feature_name.pascalCase()}}RemoteDataSource {
  Future<List<{{feature_name.pascalCase()}}Model>> get{{feature_name.pascalCase()}}s({
    required String token,
    int page = 1,
  });

  Future<{{feature_name.pascalCase()}}Model> get{{feature_name.pascalCase()}}({required String id, required String token});


  Future<void> create{{feature_name.pascalCase()}}({
    required {{feature_name.pascalCase()}}Model {{feature_name.camelCase()}},
    required String token,
  });

  Future<void> update{{feature_name.pascalCase()}}({
    required {{feature_name.pascalCase()}}Model {{feature_name.camelCase()}},
    required String token,
  });

  Future<void> delete{{feature_name.pascalCase()}}({required String id, required String token});
}

class {{feature_name.pascalCase()}}RemoteDataSourceImpl implements {{feature_name.pascalCase()}}RemoteDataSource {
  final http.Client _client;

  {{feature_name.pascalCase()}}RemoteDataSourceImpl(this._client);

  @override
  Future<List<{{feature_name.pascalCase()}}Model>> get{{feature_name.pascalCase()}}s({
    required String token,
    int page = 1,
  }) async {
    final response = await _client.get(
      Uri.parse(
        '$baseUrl/{{feature_name.camelCase()}}:list',
      ).replace(queryParameters: {'page': page.toString()}),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    throwServerException(response, 200);
    final data = jsonDecode(response.body)['data'];
    return data
        .map<{{feature_name.pascalCase()}}Model>(
          (json) => {{feature_name.pascalCase()}}Model.fromJson(json as Map<String, dynamic>),
    )
        .toList();
  }

  @override
  Future<{{feature_name.pascalCase()}}Model> get{{feature_name.pascalCase()}}({required String id, required String token}) async {
    final response = await _client.get(
      Uri.parse(
        '$baseUrl/{{feature_name.camelCase()}}:get',
      ).replace(queryParameters: {'filterByTk': id.toString()}),
      headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'},
    );
    throwServerException(response, 200);
    final data = jsonDecode(response.body)['data'];
    return {{feature_name.pascalCase()}}Model.fromJson(data);
}

  @override
  Future<void> create{{feature_name.pascalCase()}}({
    required {{feature_name.pascalCase()}}Model {{feature_name.camelCase()}},
    required String token,
  }) async {
    final response = await _client.post(
      Uri.parse('$baseUrl/{{feature_name.camelCase()}}:create'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({{feature_name.camelCase()}}.toJsonForCreate()),
    );
    throwServerException(response, 200);
  }

  @override
  Future<void> update{{feature_name.pascalCase()}}({
    required {{feature_name.pascalCase()}}Model {{feature_name.camelCase()}},
    required String token,
  }) async {
    final response = await _client.post(
      Uri.parse(
        '$baseUrl/{{feature_name.camelCase()}}:update',
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
  Future<void> delete{{feature_name.pascalCase()}}({
    required String id,
    required String token,
  }) async {
    final response = await _client.post(
      Uri.parse(
        '$baseUrl/{{feature_name.camelCase()}}:destroy',
      ).replace(queryParameters: {'filterByTk': id}),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    throwServerException(response, 200);
  }
}
