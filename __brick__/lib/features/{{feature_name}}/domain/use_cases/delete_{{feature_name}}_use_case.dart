import '../../../../../core/usecase/usecase.dart';
import '../../../../../core/utils/helper/type_definition.dart';
import '../../../../../features/{{feature_name}}/domain/repositories/{{feature_name}}_repos.dart';

class Delete{{feature_name}}UseCase implements UseCaseWithParams<void, String> {
  final {{feature_name}}Repos _repository;

  const Delete{{feature_name}}UseCase(this._repository);

  @override
  ResultVoid call(String params) async =>
      await _repository.delete{{feature_name}}(id: params);
}
