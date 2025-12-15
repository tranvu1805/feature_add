part of '{{feature_name.snakeCase()}}s_bloc.dart';

enum {{feature_name.pascalCase()}}sStatus { initial, loading, success, failure }

final class {{feature_name.pascalCase()}}sState extends Equatable {
  const {{feature_name.pascalCase()}}sState({
    this.{{feature_name.camelCase()}}s = const [],
    this.status = {{feature_name.pascalCase()}}sStatus.initial,
    this.hasReachedMax = false,
    this.currentPage = 1,
    this.action = '',
    this.error = '',
  });

  final List<{{feature_name.pascalCase()}}> {{feature_name.camelCase()}}s;
  final String action;
  final String error;
  final bool hasReachedMax;
  final int currentPage;
  final {{feature_name.pascalCase()}}sStatus status;

  {{feature_name.pascalCase()}}sState copyWith({
    List<{{feature_name.pascalCase()}}>? {{feature_name.camelCase()}}s,
    {{feature_name.pascalCase()}}sStatus? status,
    bool? hasReachedMax,
    int? currentPage,
    String? action,
    String? error,
  }) {
    return {{feature_name.pascalCase()}}sState(
      {{feature_name.camelCase()}}s: {{feature_name.camelCase()}}s ?? this.{{feature_name.camelCase()}}s,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
      action: action ?? this.action,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [{{feature_name.camelCase()}}s, status, hasReachedMax, currentPage, action, error];
}
