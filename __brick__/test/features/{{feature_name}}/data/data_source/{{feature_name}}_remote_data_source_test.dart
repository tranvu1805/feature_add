import 'dart:convert';

import 'package:{{project_name.snakeCase()}}/core/constants/app.dart';
import 'package:{{project_name.snakeCase()}}/core/errors/exceptions.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/data/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late MockClient client;
  late {{feature_name.pascalCase()}}RemoteDataSource dataSource;
  const tToken = 'token';
  const tPage = 1;
  const tId = 'id';
  const tKeyword = 'test';
  const t{{feature_name.pascalCase()}}Model = {{feature_name.pascalCase()}}Model.empty();
  const tException = ServerException(message: 'Unknown error', statusCode: 555);

  setUp(() {
    client = MockClient();
    dataSource = {{feature_name.pascalCase()}}RemoteDataSourceImpl(client);
    registerFallbackValue(Uri());
  });

  group('get{{feature_name.pascalCase()}}s', () {
    test('should call get{{feature_name.pascalCase()}}s and return list of {{feature_name.pascalCase()}}s', () async {
      // arrange
      when(
            () => client.get(any(), headers: any(named: 'headers')),
      ).thenAnswer((_) async => http.Response(jsonEncode({'data': []}), 200));
      // act
      final response = dataSource.get{{feature_name.pascalCase()}}s(page: tPage, token: tToken);
      // assert
      expect(response, completes);
      verify(
            () => client.get(
          Uri.parse('$baseUrl/{{feature_name.camelCase()}}:list',
          ).replace(queryParameters: {'appends[]': 'belong_to', 'page': tPage.toString()}),
          headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $tToken'},
        ),
      ).called(1);
      verifyNoMoreInteractions(client);
    });

    test('should call get{{feature_name.pascalCase()}}s and throw exception when unsuccessfully', () async {
      // arrange
      when(() => client.get(any(), headers: any(named: 'headers'))).thenAnswer(
            (_) async => http.Response(
          jsonEncode({
            'error': [
              {'message': 'Error'},
            ],
          }),
          555,
        ),
      );
      // act
      final response = dataSource.get{{feature_name.pascalCase()}}s(page: tPage, token: tToken);
      // assert
      expect(response, throwsA(tException));
      verify(
            () => client.get(
          Uri.parse('$baseUrl/{{feature_name.camelCase()}}:list',
          ).replace(queryParameters: {'appends[]': 'belong_to', 'page': tPage.toString()}),
          headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $tToken'},
        ),
      ).called(1);
      verifyNoMoreInteractions(client);
    });
  });

  group('get{{feature_name.pascalCase()}}', () {
    test('should call get{{feature_name.pascalCase()}} and return {{feature_name.pascalCase()}}', () async {
      // arrange
      when(
            () => client.get(any(), headers: any(named: 'headers')),
      ).thenAnswer((_) async => http.Response(jsonEncode({'data': {}}), 200));
      // act
      final response = dataSource.get{{feature_name.pascalCase()}}(id: tId, token: tToken);
      // assert
      expect(response, completes);
      verify(
            () => client.get(
          Uri.parse('$baseUrl/{{feature_name.camelCase()}}:get').replace(queryParameters: {'filterByTk': tId}),
          headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $tToken'},
        ),
      ).called(1);
      verifyNoMoreInteractions(client);
    });

    test('should call get{{feature_name.pascalCase()}} and throw exception when unsuccessfully', () async {
      // arrange
      when(() => client.get(any(), headers: any(named: 'headers'))).thenAnswer(
            (_) async => http.Response(
          jsonEncode({
            'error': [
              {'message': 'Error'},
            ],
          }),
          555,
        ),
      );
      // act
      final response = dataSource.get{{feature_name.pascalCase()}}(id: tId, token: tToken);
      // assert
      expect(response, throwsA(tException));
      verify(
            () => client.get(
          Uri.parse('$baseUrl/{{feature_name.camelCase()}}:get').replace(queryParameters: {'filterByTk': tId}),
          headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $tToken'},
        ),
      ).called(1);
      verifyNoMoreInteractions(client);
    });
  });

  group('create{{feature_name.pascalCase()}}', () {
    test('should call create{{feature_name.pascalCase()}} and return void when successfully', () async {
      // arrange
      when(
            () => client.post(
          any(),
          headers: any(named: 'headers'),
          body: any(named: 'body'),
        ),
      ).thenAnswer((_) async => http.Response('data', 200));
      // act
      final response = dataSource.create{{feature_name.pascalCase()}}(token: tToken, {{feature_name.camelCase()}}: t{{feature_name.pascalCase()}}Model);
      // assert
      expect(response, completes);
      verify(
            () => client.post(
          Uri.parse('$baseUrl/{{feature_name.camelCase()}}:create'),
          headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $tToken'},
          body: jsonEncode(t{{feature_name.pascalCase()}}Model.toJsonForCreate()),
        ),
      ).called(1);
      verifyNoMoreInteractions(client);
    });

    test('should call create{{feature_name.pascalCase()}} and throw exception when unsuccessfully', () async {
      // arrange
      when(
            () => client.post(
          any(),
          headers: any(named: 'headers'),
          body: any(named: 'body'),
        ),
      ).thenAnswer(
            (_) async => http.Response(
          jsonEncode({
            'error': [
              {'message': 'Error'},
            ],
          }),
          555,
        ),
      );
      // act
      final response = dataSource.create{{feature_name.pascalCase()}}(token: tToken, {{feature_name.camelCase()}}: t{{feature_name.pascalCase()}}Model);
      // assert
      expect(response, throwsA(tException));
      verify(
            () => client.post(
          Uri.parse('$baseUrl/{{feature_name.camelCase()}}:create'),
          headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $tToken'},
          body: jsonEncode(t{{feature_name.pascalCase()}}Model.toJsonForCreate()),
        ),
      ).called(1);
      verifyNoMoreInteractions(client);
    });
  });

  group('update{{feature_name.pascalCase()}}', () {
    test('should call update{{feature_name.pascalCase()}} and return void when successfully', () async {
      // arrange
      when(
            () => client.post(
          any(),
          headers: any(named: 'headers'),
          body: any(named: 'body'),
        ),
      ).thenAnswer((_) async => http.Response('data', 200));
      // act
      final response = dataSource.update{{feature_name.pascalCase()}}(token: tToken, {{feature_name.camelCase()}}: t{{feature_name.pascalCase()}}Model);
      // assert
      expect(response, completes);
      verify(
            () => client.post(
          Uri.parse('$baseUrl/{{feature_name.camelCase()}}:update',
          ).replace(queryParameters: {'filterByTk': t{{feature_name.pascalCase()}}Model.id}),
          headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $tToken'},
          body: jsonEncode(t{{feature_name.pascalCase()}}Model.toJsonForCreate()),
        ),
      ).called(1);
      verifyNoMoreInteractions(client);
    });

    test('should call update{{feature_name.pascalCase()}} and throw exception when unsuccessfully', () async {
      // arrange
      when(
            () => client.post(
          any(),
          headers: any(named: 'headers'),
          body: any(named: 'body'),
        ),
      ).thenAnswer(
            (_) async => http.Response(
          jsonEncode({
            'error': [
              {'message': 'Error'},
            ],
          }),
          555,
        ),
      );
      // act
      final response = dataSource.update{{feature_name.pascalCase()}}(token: tToken, {{feature_name.camelCase()}}: t{{feature_name.pascalCase()}}Model);
      // assert
      expect(response, throwsA(tException));
      verify(
            () => client.post(
          Uri.parse('$baseUrl/{{feature_name.camelCase()}}:update',
          ).replace(queryParameters: {'filterByTk': t{{feature_name.pascalCase()}}Model.id}),
          headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $tToken'},
          body: jsonEncode(t{{feature_name.pascalCase()}}Model.toJsonForCreate()),
        ),
      ).called(1);
      verifyNoMoreInteractions(client);
    });
  });

  group('delete{{feature_name.pascalCase()}}', () {
    test('should call delete{{feature_name.pascalCase()}} and return void when successfully', () async {
      // arrange
      when(
            () => client.post(any(), headers: any(named: 'headers')),
      ).thenAnswer((_) async => http.Response('data', 200));
      // act
      final response = dataSource.delete{{feature_name.pascalCase()}}(id: tId, token: tToken);
      // assert
      expect(response, completes);
      verify(
            () => client.post(
          Uri.parse('$baseUrl/{{feature_name.camelCase()}}:destroy').replace(queryParameters: {'filterByTk': tId}),
          headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $tToken'},
        ),
      ).called(1);
      verifyNoMoreInteractions(client);
    });

    test('should call delete{{feature_name.pascalCase()}} and throw exception when unsuccessfully', () async {
      // arrange
      when(() => client.post(any(), headers: any(named: 'headers'))).thenAnswer(
            (_) async => http.Response(
          jsonEncode({
            'error': [
              {'message': 'Error'},
            ],
          }),
          555,
        ),
      );
      // act
      final response = dataSource.delete{{feature_name.pascalCase()}}(id: tId, token: tToken);
      // assert
      expect(response, throwsA(tException));
      verify(
            () => client.post(
          Uri.parse('$baseUrl/{{feature_name.camelCase()}}:destroy').replace(queryParameters: {'filterByTk': tId}),
          headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $tToken'},
        ),
      ).called(1);
      verifyNoMoreInteractions(client);
    });
  });

}

