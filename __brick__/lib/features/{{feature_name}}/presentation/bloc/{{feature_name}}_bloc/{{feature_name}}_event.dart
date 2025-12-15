part of '{{feature_name.snakeCase()}}_bloc.dart';

sealed class {{feature_name.pascalCase()}}Event extends Equatable {
  const {{feature_name.pascalCase()}}Event();
  @override
  List<Object> get props => [];
}

final class {{feature_name.pascalCase()}}Requested extends {{feature_name.pascalCase()}}Event {
  final String id;

  const {{feature_name.pascalCase()}}Requested({required this.id});

  @override
  List<Object> get props => [id];
}

final class {{feature_name.pascalCase()}}Created extends {{feature_name.pascalCase()}}Event {
  final Create{{feature_name.pascalCase()}}UseCaseParams param;

  const {{feature_name.pascalCase()}}Created({required this.param});

  @override
  List<Object> get props => [param];
}

final class {{feature_name.pascalCase()}}Updated extends {{feature_name.pascalCase()}}Event {
  final Update{{feature_name.pascalCase()}}UseCaseParams param;

  const {{feature_name.pascalCase()}}Updated({required this.param});

  @override
  List<Object> get props => [param];
}
final class {{feature_name.pascalCase()}}Deleted extends {{feature_name.pascalCase()}}Event {
final String id;

const {{feature_name.pascalCase()}}Deleted({required this.id});

@override
List<Object> get props => [id];
}