import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class Mock{{feature_name.pascalCase()}}Repos extends Mock implements {{feature_name.pascalCase()}}Repos {}

void main() {
  late {{feature_name.pascalCase()}}Repos repository;
  late Get{{feature_name.pascalCase()}}UseCase useCase;

  const tId = '1';
  const t{{feature_name.pascalCase()}} = {{feature_name.pascalCase()}}.empty();

  setUp(() {
    repository = Mock{{feature_name.pascalCase()}}Repos();
    useCase = Get{{feature_name.pascalCase()}}UseCase(repository);
  });

  test('should call [{{feature_name.pascalCase()}}Repos.get{{feature_name.pascalCase()}}]', () async {
    // arrange
    when(
          () => repository.get{{feature_name.pascalCase()}}(id: any(named: 'id')),
    ).thenAnswer((_) async => const Right(t{{feature_name.pascalCase()}}));
    // act
    final result = await useCase(tId);
    // assert
    expect(result, equals(const Right(t{{feature_name.pascalCase()}})));
    verify(() => repository.get{{feature_name.pascalCase()}}(id: tId)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
