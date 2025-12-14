part of '{{feature_name}}_bloc.dart';

sealed class {{feature_name}}Event extends Equatable {
  const {{feature_name}}Event();
  @override
  List<Object> get props => [];
}

final class {{feature_name}}Requested extends {{feature_name}}Event {
  final String id;

  const {{feature_name}}Requested({required this.id});

  @override
  List<Object> get props => [id];
}

final class {{feature_name}}Created extends {{feature_name}}Event {
  final Create{{feature_name}}UseCaseParams param;

  const {{feature_name}}Created({required this.param});

  @override
  List<Object> get props => [param];
}

final class {{feature_name}}Updated extends {{feature_name}}Event {
  final Update{{feature_name}}UseCaseParams param;

  const {{feature_name}}Updated({required this.param});

  @override
  List<Object> get props => [param];
}
