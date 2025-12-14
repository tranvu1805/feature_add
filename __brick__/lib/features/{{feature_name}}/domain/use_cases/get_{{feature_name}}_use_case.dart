import '../../../../../core/usecase/usecase.dart';
import '../../../../../core/utils/helper/type_definition.dart';
import '../../../../../features/{{feature_name}}/domain/repositories/{{feature_name}}_repos.dart';

import '../entities/{{feature_name}}.dart';


class Get{{feature_name}}UseCase implements UseCaseWithParams<{{feature_name}}, String> {
  const Get{{feature_name}}UseCase(this._repository);

  final {{feature_name}}Repos _repository;

  @override
  ResultFuture<{{feature_name}}> call(String id) => _repository.get{{feature_name}}(id: id);
}
