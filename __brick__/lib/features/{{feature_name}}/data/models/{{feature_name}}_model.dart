import '../../../../../features/{{feature_name}}/domain/entities/{{feature_name}}.dart';
import 'package:equatable/equatable.dart';

class {{feature_name}}Model extends Equatable {

  const {{feature_name}}Model({});
  const {{feature_name}}Model.empty()
      : ;

  const {{feature_name}}Model.toCreate()
      : this();

  {{feature_name}} toEntity() => {{feature_name}}();

  {{feature_name}}Model copyWith({}) => {{feature_name}}Model();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    return map;
  }

  Map<String, dynamic> toJsonForCreate() {
    final map = <String, dynamic>{};
    return map;
  }

{{feature_name}}Model.fromJson(dynamic json)
      : this();

  @override
  List<Object?> get props => [];
}
