import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/domain.dart';
import 'package:equatable/equatable.dart';

class {{feature_name.pascalCase()}}Model extends Equatable {

  const {{feature_name.pascalCase()}}Model({});
  const {{feature_name.pascalCase()}}Model.empty()
      : ;

  const {{feature_name.pascalCase()}}Model.toCreate()
      : this();

  const {{feature_name.pascalCase()}}Model.toUpdate()
      : this();

  {{feature_name.pascalCase()}} toEntity() => {{feature_name.pascalCase()}}();

  {{feature_name.pascalCase()}}Model copyWith({}) => {{feature_name.pascalCase()}}Model();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    return map;
  }

  Map<String, dynamic> toJsonForCreate() {
    final map = <String, dynamic>{};
    return map;
  }

  {{feature_name.pascalCase()}}Model.fromJson(dynamic json)
      : this();

  @override
  List<Object?> get props => [];
}
