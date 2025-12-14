import '../../../../../core/utils/helper/type_definition.dart';

import '../entities/{{feature_name}}.dart';
import '../use_cases/use_cases.dart';

abstract interface class {{feature_name}}Repos {
  ResultFuture<List<{{feature_name}}>> get{{feature_name}}s({required int page});

  ResultFuture<{{feature_name}}> get{{feature_name}}({required String id});

  ResultVoid create{{feature_name}}({required Create{{feature_name}}Params params});

  ResultVoid update{{feature_name}}({required Update{{feature_name}}Params params});

  ResultVoid delete{{feature_name}}({required String id});
}
