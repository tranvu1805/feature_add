import '../../../../../core/usecase/usecase.dart';
import '../../../../../core/utils/helper/type_definition.dart';
import '../../../../../features/{{feature_name}}/domain/repositories/{{feature_name}}_repos.dart';
import 'package:equatable/equatable.dart';

class Update{{feature_name}}UseCase
    implements UseCaseWithParams<void, Update{{feature_name}}Params> {
  final {{feature_name}}Repos _repository;

  const Update{{feature_name}}UseCase(this._repository);

  @override
  ResultVoid call(Update{{feature_name}}Params params) async =>
      await _repository.update{{feature_name}}(params: params);
}

class Update{{feature_name}}Params extends Equatable {

  const Update{{feature_name}}Params({});

  const Update{{feature_name}}Params.empty({});

  @override
  List<Object?> get props => [];
}
