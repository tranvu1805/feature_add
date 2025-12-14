part of '{{feature_name}}s_bloc.dart';

sealed class {{feature_name}}sEvent extends Equatable {
  const {{feature_name}}sEvent();

  @override
  List<Object> get props => [];
}

final class {{feature_name}}sRequested extends {{feature_name}}sEvent {}

final class {{feature_name}}sRefreshed extends {{feature_name}}sEvent {}

