import 'package:{{project_name.snakeCase()}}/core/use_case/use_case.dart';
import 'package:{{project_name.snakeCase()}}/core/utils/helper/type_definition.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/domain.dart';

class Delete{{feature_name.pascalCase()}}UseCase implements UseCaseWithParams<void, String> {
  final {{feature_name.pascalCase()}}Repos _repository;

  const Delete{{feature_name.pascalCase()}}UseCase(this._repository);

  @override
  ResultVoid call(String params) async =>
      await _repository.delete{{feature_name.pascalCase()}}(id: params);
}
