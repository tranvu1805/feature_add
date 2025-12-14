part of '{{feature_name}}_bloc.dart';

sealed class {{feature_name}}State extends Equatable {
  const {{feature_name}}State();

  @override
  List<Object> get props => [];
}

final class {{feature_name}}Initial extends {{feature_name}}State {}

final class {{feature_name}}InProgress extends {{feature_name}}State {}

final class {{feature_name}}CreateSuccess extends {{feature_name}}State {}

final class {{feature_name}}UpdateSuccess extends {{feature_name}}State {}

final class {{feature_name}}Success extends {{feature_name}}State {
  final {{feature_name}} {{feature_name.camelCase()}};

  const {{feature_name}}Success({required this.{{feature_name.camelCase()}}});

  @override
  List<Object> get props => [{{feature_name.camelCase()}}];
}

final class {{feature_name}}Failure extends {{feature_name}}State {
  final String error;

  const {{feature_name}}Failure({required this.error});

  @override
  List<Object> get props => [error];
}
