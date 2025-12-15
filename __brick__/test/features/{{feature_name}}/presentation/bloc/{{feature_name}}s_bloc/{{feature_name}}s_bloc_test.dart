import 'package:{{project_name.snakeCase()}}/core/errors/failures.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/domain.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/presentation/presentation.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockGet{{feature_name.pascalCase()}}sUseCase extends Mock implements Get{{feature_name.pascalCase()}}sUseCase {}

void main() {
  late Get{{feature_name.pascalCase()}}sUseCase get{{feature_name.pascalCase()}}sUseCase;
  late {{feature_name.pascalCase()}}sBloc {{feature_name.camelCase()}};
  const tFailure = ServerFailure(message: 'error', statusCode: 555);

  setUp(() {
    get{{feature_name.pascalCase()}}sUseCase = MockGet{{feature_name.pascalCase()}}sUseCase();
    {{feature_name.camelCase()}} = {{feature_name.pascalCase()}}sBloc(
      get{{feature_name.pascalCase()}}sUseCase: get{{feature_name.pascalCase()}}sUseCase,
    );
  });

  group('{{feature_name.pascalCase()}}sRequested', () {
    blocTest(
      'should emit {{feature_name.pascalCase()}}sSuccess when successfully',
      build: () => {{feature_name.camelCase()}},
      setUp: () {
        when(() => get{{feature_name.pascalCase()}}sUseCase(any())).thenAnswer((_) async => const Right(<{{feature_name.pascalCase()}}>[]));
      },
      act: (bloc) => bloc.add({{feature_name.pascalCase()}}sRequested()),
      expect: () => [
        const {{feature_name.pascalCase()}}sState(status: {{feature_name.pascalCase()}}sStatus.loading),
        const {{feature_name.pascalCase()}}sState(
          {{feature_name.camelCase()}}s: [],
          status: {{feature_name.pascalCase()}}sStatus.success,
          action: 'requested',
          currentPage: 2,
          hasReachedMax: true,
        ),
      ],
    );

    blocTest(
      'should emit {{feature_name.pascalCase()}}sFailure when unsuccessfully',
      build: () => {{feature_name.camelCase()}},
      setUp: () {
        when(() => get{{feature_name.pascalCase()}}sUseCase(any())).thenAnswer((_) async => const Left(tFailure));
      },
      act: (bloc) => bloc.add({{feature_name.pascalCase()}}sRequested()),
      expect: () => [
        const {{feature_name.pascalCase()}}sState(status: {{feature_name.pascalCase()}}sStatus.loading),
    {{feature_name.pascalCase()}}sState(
          error: tFailure.message,
          status: {{feature_name.pascalCase()}}sStatus.failure,
          action: 'requested',
        ),
      ],
    );
  });

  group('{{feature_name.pascalCase()}}sRefreshed', () {
    blocTest(
      'should emit {{feature_name.pascalCase()}}sSuccess when successfully',
      build: () => {{feature_name.camelCase()}},
      setUp: () {
        when(() => get{{feature_name.pascalCase()}}sUseCase(any())).thenAnswer((_) async => const Right(<{{feature_name.pascalCase()}}>[]));
      },
      act: (bloc) => bloc.add({{feature_name.pascalCase()}}sRefreshed()),
      expect: () => [
        const {{feature_name.pascalCase()}}sState(status: {{feature_name.pascalCase()}}sStatus.initial),
        const {{feature_name.pascalCase()}}sState(status: {{feature_name.pascalCase()}}sStatus.loading),
        const {{feature_name.pascalCase()}}sState(
          {{feature_name.camelCase()}}s: [],
          status: {{feature_name.pascalCase()}}sStatus.success,
          action: 'requested',
          currentPage: 2,
          hasReachedMax: true,
        ),
      ],
    );

    blocTest(
      'should emit {{feature_name.pascalCase()}}sFailure when unsuccessfully',
      build: () => {{feature_name.camelCase()}},
      setUp: () {
        when(() => get{{feature_name.pascalCase()}}sUseCase(any())).thenAnswer((_) async => const Left(tFailure));
      },
      act: (bloc) => bloc.add({{feature_name.pascalCase()}}sRefreshed()),
      expect: () => [
        const {{feature_name.pascalCase()}}sState(status: {{feature_name.pascalCase()}}sStatus.initial),
        const {{feature_name.pascalCase()}}sState(status: {{feature_name.pascalCase()}}sStatus.loading),
    {{feature_name.pascalCase()}}sState(
          error: tFailure.message,
          status: {{feature_name.pascalCase()}}sStatus.failure,
          action: 'requested',
        ),
      ],
    );
  });

}
