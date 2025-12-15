import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class Mock{{feature_name.pascalCase()}}Repos extends Mock implements {{feature_name.pascalCase()}}Repos {}

void main() {
  late {{feature_name.pascalCase()}}Repos repository;
  late Get{{feature_name.pascalCase()}}sUseCase useCase;

  const tPage = 1;
  const t{{feature_name.pascalCase()}}s = [{{feature_name.pascalCase()}}.empty()];

  setUp(() {
    repository = Mock{{feature_name.pascalCase()}}Repos();
    useCase = Get{{feature_name.pascalCase()}}sUseCase(repository);
  });

  test('should call [{{feature_name.pascalCase()}}Repos.get{{feature_name.pascalCase()}}s]', () async {
    // arrange
    when(
          () => repository.get{{feature_name.pascalCase()}}s(page: any(named: 'page')),
    ).thenAnswer((_) async => const Right(t{{feature_name.pascalCase()}}s));
    // act
    final result = await useCase(tPage);
    // assert
    expect(result, equals(const Right(t{{feature_name.pascalCase()}}s)));
    verify(() => repository.get{{feature_name.pascalCase()}}s(page: tPage)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
