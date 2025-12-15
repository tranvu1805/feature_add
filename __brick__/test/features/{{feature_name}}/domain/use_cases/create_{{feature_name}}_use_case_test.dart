import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class Mock{{feature_name.pascalCase()}}Repos extends Mock implements {{feature_name.pascalCase()}}Repos {}

void main() {
  late {{feature_name.pascalCase()}}Repos repository;
  late Create{{feature_name.pascalCase()}}UseCase useCase;

  const tParams = Create{{feature_name.pascalCase()}}UseCaseParams.empty();

  setUp(() {
    repository = Mock{{feature_name.pascalCase()}}Repos();
    useCase = Create{{feature_name.pascalCase()}}UseCase(repository);
    registerFallbackValue(tParams);
  });

  test('should call [{{feature_name.pascalCase()}}Repos.create{{feature_name.pascalCase()}}]', () async {
    // arrange
    when(
          () => repository.create{{feature_name.pascalCase()}}(params: any(named: 'params')),
    ).thenAnswer((_) async => const Right(null));
    // act
    final result = await useCase(tParams);
    // assert
    expect(result, equals(const Right(null)));
    verify(() => repository.create{{feature_name.pascalCase()}}(params: tParams)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
