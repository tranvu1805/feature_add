import 'package:{{project_name.snakeCase()}}/core/use_case/use_case.dart';
import 'package:{{project_name.snakeCase()}}/core/utils/helper/type_definition.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/domain.dart';



class Get{{feature_name.pascalCase()}}UseCase implements UseCaseWithParams<{{feature_name.pascalCase()}}, String> {
  const Get{{feature_name.pascalCase()}}UseCase(this._repository);

  final {{feature_name.pascalCase()}}Repos _repository;

  @override
  ResultFuture<{{feature_name.pascalCase()}}> call(String id) => _repository.get{{feature_name.pascalCase()}}(id: id);
}
