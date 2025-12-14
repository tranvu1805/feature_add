import '../../../../../core/usecase/usecase.dart';
import '../../../../../core/utils/helper/type_definition.dart';
import '../../../../../features/{{feature_name}}/domain/repositories/{{feature_name}}_repos.dart';

import '../entities/{{feature_name}}.dart';

class Get{{feature_name}}sUseCase
    implements UseCaseWithParams<List<{{feature_name}}>, int> {
  final {{feature_name}}Repos _repository;

  const Get{{feature_name}}sUseCase(this._repository);

  @override
  ResultFuture<List<{{feature_name}}>> call(int page) async =>
      await _repository.get{{feature_name}}s(page: page);
}
