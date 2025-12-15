import 'package:{{project_name.snakeCase()}}/core/use_case/use_case.dart';
import 'package:{{project_name.snakeCase()}}/core/utils/helper/type_definition.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/domain.dart';
import 'package:equatable/equatable.dart';

class Update{{feature_name.pascalCase()}}UseCase
    implements UseCaseWithParams<void, Update{{feature_name.pascalCase()}}UseCaseParams> {
  final {{feature_name.pascalCase()}}Repos _repository;

  const Update{{feature_name.pascalCase()}}UseCase(this._repository);

  @override
  ResultVoid call(Update{{feature_name.pascalCase()}}UseCaseParams params) async =>
      await _repository.update{{feature_name.pascalCase()}}(params: params);
}

class Update{{feature_name.pascalCase()}}UseCaseParams extends Equatable {

  const Update{{feature_name.pascalCase()}}UseCaseParams({});

  const Update{{feature_name.pascalCase()}}UseCaseParams.empty({});

  @override
  List<Object?> get props => [];
}
