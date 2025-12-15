part of '{{feature_name.snakeCase()}}_bloc.dart';

sealed class {{feature_name.pascalCase()}}State extends Equatable {
  const {{feature_name.pascalCase()}}State();

  @override
  List<Object> get props => [];
}

final class {{feature_name.pascalCase()}}Initial extends {{feature_name.pascalCase()}}State {}

final class {{feature_name.pascalCase()}}InProgress extends {{feature_name.pascalCase()}}State {}

final class {{feature_name.pascalCase()}}CreateSuccess extends {{feature_name.pascalCase()}}State {}

final class {{feature_name.pascalCase()}}UpdateSuccess extends {{feature_name.pascalCase()}}State {}

final class {{feature_name.pascalCase()}}DeleteSuccess extends {{feature_name.pascalCase()}}State {}

final class {{feature_name.pascalCase()}}Success extends {{feature_name.pascalCase()}}State {
  final {{feature_name.pascalCase()}} {{feature_name.camelCase()}};

  const {{feature_name.pascalCase()}}Success({required this.{{feature_name.camelCase()}}});

  @override
  List<Object> get props => [{{feature_name.camelCase()}}];
}

final class {{feature_name.pascalCase()}}Failure extends {{feature_name.pascalCase()}}State {
  final String error;

  const {{feature_name.pascalCase()}}Failure({required this.error});

  @override
  List<Object> get props => [error];
}
