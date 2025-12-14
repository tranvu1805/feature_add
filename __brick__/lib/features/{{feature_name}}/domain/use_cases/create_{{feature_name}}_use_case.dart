import '../../../../../core/usecase/usecase.dart';
import '../../../../../core/utils/helper/type_definition.dart';
import '../../../../../features/{{feature_name}}/domain/repositories/{{feature_name}}_repos.dart';
import 'package:equatable/equatable.dart';

class Create{{feature_name}}UseCase
    implements UseCaseWithParams<void, Create{{feature_name}}Params> {
  final {{feature_name}}Repos _repository;

  const Create{{feature_name}}UseCase(this._repository);

  @override
  ResultVoid call(Create{{feature_name}}Params params) async =>
      await _repository.create{{feature_name}}(params: params);
}

class Create{{feature_name}}Params extends Equatable {

  const Create{{feature_name}}Params({});

  const Create{{feature_name}}Params.empty({});

  @override
  List<Object?> get props => [];
}
