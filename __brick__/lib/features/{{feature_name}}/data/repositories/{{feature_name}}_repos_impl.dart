import '../../../../../core/common/common_local_data_source.dart';
import '../../../../../core/utils/network/api_service.dart';
import '../../../../../core/utils/helper/type_definition.dart';
import '../../../../../features/{{feature_name}}/data/data_source/{{feature_name}}_remote_data_source.dart';
import '../../../../../features/{{feature_name}}/data/models/{{feature_name}}_model.dart';
import '../../../../../features/{{feature_name}}/domain/entities/{{feature_name}}.dart';
import '../../../../../features/{{feature_name}}/domain/repositories/{{feature_name}}_repos.dart';
import '../../../../../features/{{feature_name}}/domain/use_cases/create_{{feature_name}}_use_case.dart';
import '../../../../../features/{{feature_name}}/domain/use_cases/update_{{feature_name}}_use_case.dart';

class {{feature_name}}ReposImpl implements {{feature_name}}Repos {
  final {{feature_name}}RemoteDataSource _remoteDataSource;
  final CommonLocalDataSource _authLocalDataSource;

  {{feature_name}}ReposImpl({
    required {{feature_name}}RemoteDataSource remoteDataSource,
    required CommonLocalDataSource commonLocalDataSource,
  }) : _remoteDataSource = remoteDataSource,
       _authLocalDataSource = commonLocalDataSource;

  @override
  ResultFuture<List<{{feature_name}}>> get{{feature_name}}s({required int page}) async {
    return ApiHelper.handle(() async {
      final token = await _authLocalDataSource.getToken();
      final models = await _remoteDataSource.get{{feature_name}}s(
        token: token,
        page: page,
      );
      return models.map<{{feature_name}}>((model) => model.toEntity()).toList();
    });
  }

  @override
  ResultVoid create{{feature_name}}({required Create{{feature_name}}Params params}) {
    return ApiHelper.handle(() async {
      final model = {{feature_name}}Model();
      final token = await _authLocalDataSource.getToken();
      await _remoteDataSource.create{{feature_name}}(
        {{feature_name}}: model,
        token: token,
      );
    });
  }

  @override
  ResultVoid update{{feature_name}}({required Update{{feature_name}}Params params}) {
    return ApiHelper.handle(() async {
      final model = {{feature_name}}Model();
      final token = await _authLocalDataSource.getToken();
      await _remoteDataSource.update{{feature_name}}(
        {{feature_name}}: model,
        token: token,
      );
    });
  }

  @override
  ResultVoid delete{{feature_name}}({required String id}) {
    return ApiHelper.handle(() async {
      final token = await _authLocalDataSource.getToken();
      await _remoteDataSource.delete{{feature_name}}(id: id, token: token);
    });
  }

  Future<{{feature_name}}Model> get{{feature_name}}({required String id}) async {
    return ApiHelper.handle(() async {
      final token = await _authLocalDataSource.getToken();
      await _remoteDataSource.get{{feature_name}}(id: id, token: token);
    });
  }
}
