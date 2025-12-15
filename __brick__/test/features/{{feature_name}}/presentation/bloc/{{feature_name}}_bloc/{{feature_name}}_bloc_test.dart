import 'package:{{project_name.snakeCase()}}/core/errors/failures.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/domain.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/presentation/presentation.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockCreate{{feature_name.pascalCase()}}UseCase extends Mock implements Create{{feature_name.pascalCase()}}UseCase {}

class MockUpdate{{feature_name.pascalCase()}}UseCase extends Mock implements Update{{feature_name.pascalCase()}}UseCase {}

class MockGet{{feature_name.pascalCase()}}UseCase extends Mock implements Get{{feature_name.pascalCase()}}UseCase {}

class MockDelete{{feature_name.pascalCase()}}UseCase extends Mock implements Delete{{feature_name.pascalCase()}}UseCase {}

void main() {
  late Create{{feature_name.pascalCase()}}UseCase create{{feature_name.pascalCase()}}UseCase;
  late Update{{feature_name.pascalCase()}}UseCase update{{feature_name.pascalCase()}}UseCase;
  late Get{{feature_name.pascalCase()}}UseCase get{{feature_name.pascalCase()}}UseCase;
  late Delete{{feature_name.pascalCase()}}UseCase delete{{feature_name.pascalCase()}}UseCase;
  late {{feature_name.pascalCase()}}Bloc {{feature_name.camelCase()}}Bloc;
  const tFailure = ServerFailure(message: 'error', statusCode: 555);
  const tId = '1';
  const tCreate{{feature_name.pascalCase()}}Params = Create{{feature_name.pascalCase()}}UseCaseParams.empty();
  const tUpdate{{feature_name.pascalCase()}}Params = Update{{feature_name.pascalCase()}}UseCaseParams.empty();

  setUp(() {
    create{{feature_name.pascalCase()}}UseCase = MockCreate{{feature_name.pascalCase()}}UseCase();
    update{{feature_name.pascalCase()}}UseCase = MockUpdate{{feature_name.pascalCase()}}UseCase();
    get{{feature_name.pascalCase()}}UseCase = MockGet{{feature_name.pascalCase()}}UseCase();
    delete{{feature_name.pascalCase()}}UseCase = MockDelete{{feature_name.pascalCase()}}UseCase();
    {{feature_name.camelCase()}}Bloc = {{feature_name.pascalCase()}}Bloc(
      create{{feature_name.pascalCase()}}UseCase: create{{feature_name.pascalCase()}}UseCase,
      update{{feature_name.pascalCase()}}UseCase: update{{feature_name.pascalCase()}}UseCase,
      get{{feature_name.pascalCase()}}UseCase: get{{feature_name.pascalCase()}}UseCase,
      delete{{feature_name.pascalCase()}}UseCase: delete{{feature_name.pascalCase()}}UseCase,
    );
    registerFallbackValue(tCreate{{feature_name.pascalCase()}}Params);
    registerFallbackValue(tUpdate{{feature_name.pascalCase()}}Params);
  });

  group('{{feature_name.pascalCase()}}Requested', () {
    blocTest(
      'should emit {{feature_name.pascalCase()}}Success when successfully',
      build: () => {{feature_name.camelCase()}}Bloc,
      setUp: () {
        when(
              () => get{{feature_name.pascalCase()}}UseCase(any()),
        ).thenAnswer((_) async => const Right({{feature_name.pascalCase()}}.empty()));
      },
      act: (bloc) => bloc.add(const {{feature_name.pascalCase()}}Requested(id: tId)),
      expect: () => [{{feature_name.pascalCase()}}InProgress(), {{feature_name.pascalCase()}}Success({{feature_name.camelCase()}}: const {{feature_name.pascalCase()}}.empty())],
    );

    blocTest(
      'should emit {{feature_name.pascalCase()}}Failure when unsuccessfully',
      build: () => {{feature_name.camelCase()}}Bloc,
      setUp: () {
        when(() => get{{feature_name.pascalCase()}}UseCase(any())).thenAnswer((_) async => const Left(tFailure));
      },
      act: (bloc) => bloc.add(const {{feature_name.pascalCase()}}Requested(id: tId)),
      expect: () => [{{feature_name.pascalCase()}}InProgress(), {{feature_name.pascalCase()}}Failure(error: tFailure.message)],
    );
  });

  group('{{feature_name.pascalCase()}}Created', () {
    blocTest(
      'should emit {{feature_name.pascalCase()}}CreateSuccess when successfully',
      build: () => {{feature_name.camelCase()}}Bloc,
      setUp: () {
        when(() => create{{feature_name.pascalCase()}}UseCase(any())).thenAnswer((_) async => const Right(null));
      },
      act: (bloc) => bloc.add(const {{feature_name.pascalCase()}}Created(param: tCreate{{feature_name.pascalCase()}}Params)),
      expect: () => [{{feature_name.pascalCase()}}InProgress(), {{feature_name.pascalCase()}}CreateSuccess()],
    );

    blocTest(
      'should emit {{feature_name.pascalCase()}}Failure when unsuccessfully',
      build: () => {{feature_name.camelCase()}}Bloc,
      setUp: () {
        when(() => create{{feature_name.pascalCase()}}UseCase(any())).thenAnswer((_) async => const Left(tFailure));
      },
      act: (bloc) => bloc.add(const {{feature_name.pascalCase()}}Created(param: tCreate{{feature_name.pascalCase()}}Params)),
      expect: () => [{{feature_name.pascalCase()}}InProgress(), {{feature_name.pascalCase()}}Failure(error: tFailure.message)],
    );
  });

  group('{{feature_name.pascalCase()}}Updated', () {
    blocTest(
      'should emit {{feature_name.pascalCase()}}UpdateSuccess when successfully',
      build: () => {{feature_name.camelCase()}}Bloc,
      setUp: () {
        when(() => update{{feature_name.pascalCase()}}UseCase(any())).thenAnswer((_) async => const Right(null));
        when(
              () => get{{feature_name.pascalCase()}}UseCase(any()),
        ).thenAnswer((_) async => const Right({{feature_name.pascalCase()}}.empty()));
      },
      act: (bloc) => bloc.add(const {{feature_name.pascalCase()}}Updated(param: tUpdate{{feature_name.pascalCase()}}Params)),
      expect: () => [
    {{feature_name.pascalCase()}}InProgress(),
    {{feature_name.pascalCase()}}UpdateSuccess(),
    {{feature_name.pascalCase()}}InProgress(),
    {{feature_name.pascalCase()}}Success({{feature_name.camelCase()}}: const {{feature_name.pascalCase()}}.empty()),
      ],
    );

    blocTest(
      'should emit {{feature_name.pascalCase()}}Failure when unsuccessfully',
      build: () => {{feature_name.camelCase()}}Bloc,
      setUp: () {
        when(() => update{{feature_name.pascalCase()}}UseCase(any())).thenAnswer((_) async => const Left(tFailure));
      },
      act: (bloc) => bloc.add(const {{feature_name.pascalCase()}}Updated(param: tUpdate{{feature_name.pascalCase()}}Params)),
      expect: () => [{{feature_name.pascalCase()}}InProgress(), {{feature_name.pascalCase()}}Failure(error: tFailure.message)],
    );
  });

  group('{{feature_name.pascalCase()}}Deleted', () {
    blocTest(
      'should emit {{feature_name.pascalCase()}}DeleteSuccess when successfully',
      build: () => {{feature_name.camelCase()}}Bloc,
      setUp: () {
        when(() => delete{{feature_name.pascalCase()}}UseCase(any())).thenAnswer((_) async => const Right(null));
      },
      act: (bloc) => bloc.add(const {{feature_name.pascalCase()}}Deleted(id: tId)),
      expect: () => [{{feature_name.pascalCase()}}InProgress(), {{feature_name.pascalCase()}}DeleteSuccess()],
    );

    blocTest(
      'should emit {{feature_name.pascalCase()}}Failure when unsuccessfully',
      build: () => {{feature_name.camelCase()}}Bloc,
      setUp: () {
        when(() => delete{{feature_name.pascalCase()}}UseCase(any())).thenAnswer((_) async => const Left(tFailure));
      },
      act: (bloc) => bloc.add(const {{feature_name.pascalCase()}}Deleted(id: tId)),
      expect: () => [{{feature_name.pascalCase()}}InProgress(), {{feature_name.pascalCase()}}Failure(error: tFailure.message)],
    );
  });
}
