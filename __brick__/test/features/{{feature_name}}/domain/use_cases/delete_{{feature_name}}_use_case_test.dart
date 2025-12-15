import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class Mock{{feature_name.pascalCase()}}Repos extends Mock implements {{feature_name.pascalCase()}}Repos {}

void main() {
  late {{feature_name.pascalCase()}}Repos repository;
  late Delete{{feature_name.pascalCase()}}UseCase useCase;

  const tId = '1';

  setUp(() {
    repository = Mock{{feature_name.pascalCase()}}Repos();
    useCase = Delete{{feature_name.pascalCase()}}UseCase(repository);
  });

  test('should call [{{feature_name.pascalCase()}}Repos.delete{{feature_name.pascalCase()}}]', () async {
    // arrange
    when(
          () => repository.delete{{feature_name.pascalCase()}}(id: any(named: 'id')),
    ).thenAnswer((_) async => const Right(null));
    // act
    final result = await useCase(tId);
    // assert
    expect(result, equals(const Right(null)));
    verify(() => repository.delete{{feature_name.pascalCase()}}(id: tId)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
