import 'package:{{project_name.snakeCase()}}/core/data_source/common_local_data_source.dart';
import 'package:{{project_name.snakeCase()}}/core/network/api_service.dart';
import 'package:{{project_name.snakeCase()}}/core/utils/helper/type_definition.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/data/data.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/domain.dart';

class {{feature_name.pascalCase()}}ReposImpl implements {{feature_name.pascalCase()}}Repos {
  final {{feature_name.pascalCase()}}RemoteDataSource _remoteDataSource;
  final CommonLocalDataSource _authLocalDataSource;

  {{feature_name.pascalCase()}}ReposImpl({
    required {{feature_name.pascalCase()}}RemoteDataSource remoteDataSource,
    required CommonLocalDataSource commonLocalDataSource,
  }) : _remoteDataSource = remoteDataSource,
       _authLocalDataSource = commonLocalDataSource;

  @override
  ResultFuture<List<{{feature_name.pascalCase()}}>> get{{feature_name.pascalCase()}}s({required int page}) async {
    return ApiService.handle(() async {
      final token = await _authLocalDataSource.getToken();
      final models = await _remoteDataSource.get{{feature_name.pascalCase()}}s(
        token: token,
        page: page,
      );
      return models.map<{{feature_name.pascalCase()}}>((model) => model.toEntity()).toList();
    });
  }

  @override
  ResultVoid create{{feature_name.pascalCase()}}({required Create{{feature_name.pascalCase()}}UseCaseParams params}) {
    return ApiService.handle(() async {
      final model = {{feature_name.pascalCase()}}Model.toCreate();
      final token = await _authLocalDataSource.getToken();
      await _remoteDataSource.create{{feature_name.pascalCase()}}(
        {{feature_name.camelCase()}}: model,
        token: token,
      );
    });
  }

  @override
  ResultVoid update{{feature_name.pascalCase()}}({required Update{{feature_name.pascalCase()}}UseCaseParams params}) {
    return ApiService.handle(() async {
      final model = {{feature_name.pascalCase()}}Model.toUpdate();
      final token = await _authLocalDataSource.getToken();
      await _remoteDataSource.update{{feature_name.pascalCase()}}(
        {{feature_name.camelCase()}}: model,
        token: token,
      );
    });
  }

  @override
  ResultVoid delete{{feature_name.pascalCase()}}({required String id}) {
    return ApiService.handle(() async {
      final token = await _authLocalDataSource.getToken();
      await _remoteDataSource.delete{{feature_name.pascalCase()}}(id: id, token: token);
    });
  }
  @override
  ResultFuture<{{feature_name.pascalCase()}}> get{{feature_name.pascalCase()}}({required String id}) async {
    return ApiService.handle(() async {
      final token = await _authLocalDataSource.getToken();
      final model = await _remoteDataSource.get{{feature_name.pascalCase()}}(id: id, token: token);
      return model.toEntity();
    });
  }
}
