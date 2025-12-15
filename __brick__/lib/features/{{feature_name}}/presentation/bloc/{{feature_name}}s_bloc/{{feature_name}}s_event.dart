part of '{{feature_name.snakeCase()}}s_bloc.dart';

sealed class {{feature_name.pascalCase()}}sEvent extends Equatable {
  const {{feature_name.pascalCase()}}sEvent();

  @override
  List<Object> get props => [];
}

final class {{feature_name.pascalCase()}}sRequested extends {{feature_name.pascalCase()}}sEvent {}

final class {{feature_name.pascalCase()}}sRefreshed extends {{feature_name.pascalCase()}}sEvent {}

