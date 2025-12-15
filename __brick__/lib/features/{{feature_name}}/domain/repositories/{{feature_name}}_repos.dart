import 'package:{{project_name.snakeCase()}}/core/utils/helper/type_definition.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/domain.dart';

abstract interface class {{feature_name.pascalCase()}}Repos {
  ResultFuture<List<{{feature_name.pascalCase()}}>> get{{feature_name.pascalCase()}}s({required int page});

  ResultFuture<{{feature_name.pascalCase()}}> get{{feature_name.pascalCase()}}({required String id});

  ResultVoid create{{feature_name.pascalCase()}}({required Create{{feature_name.pascalCase()}}UseCaseParams params});

  ResultVoid update{{feature_name.pascalCase()}}({required Update{{feature_name.pascalCase()}}UseCaseParams params});

  ResultVoid delete{{feature_name.pascalCase()}}({required String id});
}
