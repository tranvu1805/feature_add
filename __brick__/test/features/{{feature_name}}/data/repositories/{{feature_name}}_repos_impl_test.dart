import 'package:{{project_name.snakeCase()}}/core/data_source/common_local_data_source.dart';
import 'package:{{project_name.snakeCase()}}/core/errors/exceptions.dart';
import 'package:{{project_name.snakeCase()}}/core/errors/failures.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/data/data.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class Mock{{feature_name.pascalCase()}}RemoteDataSource extends Mock implements {{feature_name.pascalCase()}}RemoteDataSource {}

class MockCommonLocalDataSource extends Mock implements CommonLocalDataSource {}

void main() {
  late Mock{{feature_name.pascalCase()}}RemoteDataSource mockRemoteDataSource;
  late MockCommonLocalDataSource mockLocalDataSource;
  late {{feature_name.pascalCase()}}ReposImpl repository;
  const tToken = 'token';
  const tPage = 1;
  const tId = 'id';
  const tException = ServerException(message: 'Unknown error', statusCode: 555);
  const tCreate{{feature_name.pascalCase()}}UseCaseParams = Create{{feature_name.pascalCase()}}UseCaseParams.empty();
  const tUpdate{{feature_name.pascalCase()}}UseCaseParams = Update{{feature_name.pascalCase()}}UseCaseParams.empty();
  final tCreate{{feature_name.pascalCase()}}Model = {{feature_name.pascalCase()}}Model();
  final tUpdate{{feature_name.pascalCase()}}Model = {{feature_name.pascalCase()}}Model();

  setUp(() {
    mockRemoteDataSource = Mock{{feature_name.pascalCase()}}RemoteDataSource();
    mockLocalDataSource = MockCommonLocalDataSource();
    repository = {{feature_name.pascalCase()}}ReposImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
    when(() => mockLocalDataSource.getToken()).thenAnswer((_) async => tToken);
    registerFallbackValue(tCreate{{feature_name.pascalCase()}}Model);
    registerFallbackValue(tUpdate{{feature_name.pascalCase()}}Model);
  });

  group('get{{feature_name.pascalCase()}}s', () {
    test('should call get{{feature_name.pascalCase()}}s and return list of {{feature_name.camelCase()}}s when successfully', () async {
      when(
            () => mockRemoteDataSource.get{{feature_name.pascalCase()}}s(
          page: any(named: 'page'),
          token: any(named: 'token'),
        ),
      ).thenAnswer((_) async => const [{{feature_name.pascalCase()}}Model.empty()]);

      final result = await repository.get{{feature_name.pascalCase()}}s(page: tPage);

      result.fold((_) {}, (list) => expect(result, equals(Right(list))));
      verify(() => mockRemoteDataSource.get{{feature_name.pascalCase()}}s(page: tPage, token: tToken)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should call get{{feature_name.pascalCase()}}s and return exception when unsuccessfully', () async {
      when(
            () => mockRemoteDataSource.get{{feature_name.pascalCase()}}s(
          page: any(named: 'page'),
          token: any(named: 'token'),
        ),
      ).thenThrow(tException);

      final result = await repository.get{{feature_name.pascalCase()}}s(page: tPage);

      expect(result, equals(Left(ServerFailure.fromException(tException))));
      verify(() => mockRemoteDataSource.get{{feature_name.pascalCase()}}s(page: tPage, token: tToken)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });

  group('get{{feature_name.pascalCase()}}', () {
    test('should call get{{feature_name.pascalCase()}} and return {{feature_name.camelCase()}} when successfully', () async {
      when(
            () => mockRemoteDataSource.get{{feature_name.pascalCase()}}(
          id: any(named: 'id'),
          token: any(named: 'token'),
        ),
      ).thenAnswer((_) async => const {{feature_name.pascalCase()}}Model.empty());

      final result = await repository.get{{feature_name.pascalCase()}}(id: tId);

      expect(result, equals(const Right({{feature_name.pascalCase()}}.empty())));
      verify(() => mockRemoteDataSource.get{{feature_name.pascalCase()}}(id: tId, token: tToken)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should call get{{feature_name.pascalCase()}} and return exception when unsuccessfully', () async {
      when(
            () => mockRemoteDataSource.get{{feature_name.pascalCase()}}(
          id: any(named: 'id'),
          token: any(named: 'token'),
        ),
      ).thenThrow(tException);

      final result = await repository.get{{feature_name.pascalCase()}}(id: tId);

      expect(result, equals(Left(ServerFailure.fromException(tException))));
      verify(() => mockRemoteDataSource.get{{feature_name.pascalCase()}}(id: tId, token: tToken)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });

  group('create{{feature_name.pascalCase()}}', () {
    test('should call create{{feature_name.pascalCase()}} when successfully', () async {
      when(
            () => mockRemoteDataSource.create{{feature_name.pascalCase()}}(
          {{feature_name.camelCase()}}: any(named: '{{feature_name.camelCase()}}'),
          token: any(named: 'token'),
        ),
      ).thenAnswer((_) async => Future.value());

      final result = await repository.create{{feature_name.pascalCase()}}(params: tCreate{{feature_name.pascalCase()}}UseCaseParams);

      expect(result, equals(const Right(null)));
      verify(
            () => mockRemoteDataSource.create{{feature_name.pascalCase()}}(token: tToken, {{feature_name.camelCase()}}: tCreate{{feature_name.pascalCase()}}Model),
      ).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should call create{{feature_name.pascalCase()}} and return exception when unsuccessfully', () async {
      when(
            () => mockRemoteDataSource.create{{feature_name.pascalCase()}}(
          token: any(named: 'token'),
      {{feature_name.camelCase()}}: any(named: '{{feature_name.camelCase()}}'),
        ),
      ).thenThrow(tException);

      final result = await repository.create{{feature_name.pascalCase()}}(params: tCreate{{feature_name.pascalCase()}}UseCaseParams);

      expect(result, equals(Left(ServerFailure.fromException(tException))));
      verify(
            () => mockRemoteDataSource.create{{feature_name.pascalCase()}}(token: tToken, {{feature_name.camelCase()}}: tCreate{{feature_name.pascalCase()}}Model),
      ).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });

  group('update{{feature_name.pascalCase()}}', () {
    test('should call update{{feature_name.pascalCase()}} when successfully', () async {
      when(
            () => mockRemoteDataSource.update{{feature_name.pascalCase()}}(
          {{feature_name.camelCase()}}: any(named: '{{feature_name.camelCase()}}'),
          token: any(named: 'token'),
        ),
      ).thenAnswer((_) async => Future.value());

      final result = await repository.update{{feature_name.pascalCase()}}(params: tUpdate{{feature_name.pascalCase()}}UseCaseParams);

      expect(result, equals(const Right(null)));
      verify(
            () => mockRemoteDataSource.update{{feature_name.pascalCase()}}(token: tToken, {{feature_name.camelCase()}}: tUpdate{{feature_name.pascalCase()}}Model),
      ).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should call update{{feature_name.pascalCase()}} and return exception when unsuccessfully', () async {
      when(
            () => mockRemoteDataSource.update{{feature_name.pascalCase()}}(
          token: any(named: 'token'),
      {{feature_name.camelCase()}}: any(named: '{{feature_name.camelCase()}}'),
        ),
      ).thenThrow(tException);

      final result = await repository.update{{feature_name.pascalCase()}}(params: tUpdate{{feature_name.pascalCase()}}UseCaseParams);

      expect(result, equals(Left(ServerFailure.fromException(tException))));
      verify(
            () => mockRemoteDataSource.update{{feature_name.pascalCase()}}(token: tToken, {{feature_name.camelCase()}}: tUpdate{{feature_name.pascalCase()}}Model),
      ).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });

  group('delete{{feature_name.pascalCase()}}', () {
    test('should call delete{{feature_name.pascalCase()}} when successfully', () async {
      when(
            () => mockRemoteDataSource.delete{{feature_name.pascalCase()}}(
          id: any(named: 'id'),
          token: any(named: 'token'),
        ),
      ).thenAnswer((_) async => Future.value());

      final result = await repository.delete{{feature_name.pascalCase()}}(id: tId);

      expect(result, equals(const Right(null)));
      verify(() => mockRemoteDataSource.delete{{feature_name.pascalCase()}}(id: tId, token: tToken)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should call delete{{feature_name.pascalCase()}} and return exception when unsuccessfully', () async {
      when(
            () => mockRemoteDataSource.delete{{feature_name.pascalCase()}}(
          id: any(named: 'id'),
          token: any(named: 'token'),
        ),
      ).thenThrow(tException);

      final result = await repository.delete{{feature_name.pascalCase()}}(id: tId);

      expect(result, equals(Left(ServerFailure.fromException(tException))));
      verify(() => mockRemoteDataSource.delete{{feature_name.pascalCase()}}(id: tId, token: tToken)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
