import 'package:{{project_name.snakeCase()}}/core/use_case/use_case.dart';
import 'package:{{project_name.snakeCase()}}/core/utils/helper/type_definition.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/domain.dart';

class Get{{feature_name.pascalCase()}}sUseCase
    implements UseCaseWithParams<List<{{feature_name.pascalCase()}}>, int> {
  final {{feature_name.pascalCase()}}Repos _repository;

  const Get{{feature_name.pascalCase()}}sUseCase(this._repository);

  @override
  ResultFuture<List<{{feature_name.pascalCase()}}>> call(int page) async =>
      await _repository.get{{feature_name.pascalCase()}}s(page: page);
}
