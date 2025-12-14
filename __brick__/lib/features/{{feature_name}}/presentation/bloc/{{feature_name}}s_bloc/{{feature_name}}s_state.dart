part of '{{feature_name}}s_bloc.dart';

enum {{feature_name}}sStatus { initial, loading, success, failure }

final class {{feature_name}}sState extends Equatable {
  const {{feature_name}}sState({
    this.{{feature_name}}s = const [],
    this.status = {{feature_name}}sStatus.initial,
    this.hasReachedMax = false,
    this.currentPage = 1,
    this.action = '',
    this.error = '',
  });

  final List<{{feature_name}}> {{feature_name.camelCase()}}s;
  final String action;
  final String error;
  final bool hasReachedMax;
  final int currentPage;
  final {{feature_name}}sStatus status;

  {{feature_name}}sState copyWith({
    List<{{feature_name}}>? {{feature_name.camelCase()}}s,
    {{feature_name}}sStatus? status,
    bool? hasReachedMax,
    int? currentPage,
    String? action,
    String? error,
  }) {
    return {{feature_name}}sState(
      {{feature_name}}s: {{feature_name}}s ?? this.{{feature_name.camelCase()}}s,
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
