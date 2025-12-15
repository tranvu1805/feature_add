import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class Mock{{feature_name.pascalCase()}}Repos extends Mock implements {{feature_name.pascalCase()}}Repos {}

void main() {
  late {{feature_name.pascalCase()}}Repos repository;
  late Update{{feature_name.pascalCase()}}UseCase useCase;

  const tParams = Update{{feature_name.pascalCase()}}UseCaseParams.empty();

  setUp(() {
    repository = Mock{{feature_name.pascalCase()}}Repos();
    useCase = Update{{feature_name.pascalCase()}}UseCase(repository);
    registerFallbackValue(tParams);
  });

  test('should call [{{feature_name.pascalCase()}}Repos.update{{feature_name.pascalCase()}}]', () async {
    // arrange
    when(
          () => repository.update{{feature_name.pascalCase()}}(params: any(named: 'params')),
    ).thenAnswer((_) async => const Right(null));
    // act
    final result = await useCase(tParams);
    // assert
    expect(result, equals(const Right(null)));
    verify(() => repository.update{{feature_name.pascalCase()}}(params: tParams)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
