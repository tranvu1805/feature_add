import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/core/constants/app.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/domain.dart';


part '{{feature_name.snakeCase()}}s_event.dart';
part '{{feature_name.snakeCase()}}s_state.dart';

class {{feature_name.pascalCase()}}sBloc extends Bloc<{{feature_name.pascalCase()}}sEvent, {{feature_name.pascalCase()}}sState> {
  final Get{{feature_name.pascalCase()}}sUseCase _get{{feature_name.pascalCase()}}sUseCase;

  {{feature_name.pascalCase()}}sBloc({required Get{{feature_name.pascalCase()}}sUseCase get{{feature_name.pascalCase()}}sUseCase,})
    : _get{{feature_name.pascalCase()}}sUseCase = get{{feature_name.pascalCase()}}sUseCase,
       super(const {{feature_name.pascalCase()}}sState()) {
    on<{{feature_name.pascalCase()}}sRequested>(_onRequested);
    on<{{feature_name.pascalCase()}}sRefreshed>(_onRefreshed);
  }

  Future<void> _onRequested({{feature_name.pascalCase()}}sRequested event,
    Emitter<{{feature_name.pascalCase()}}sState> emit,
  ) async {
    if (state.hasReachedMax || state.status == {{feature_name.pascalCase()}}sStatus.loading) return;
    if (state.currentPage == 1) {
      emit(state.copyWith(status: {{feature_name.pascalCase()}}sStatus.loading));
    }
    final result = await _get{{feature_name.pascalCase()}}sUseCase(state.currentPage);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: {{feature_name.pascalCase()}}sStatus.failure,
          error: failure.message,
          action: 'requested',
        ),
      ),
      ({{feature_name.camelCase()}}s) => emit(
        state.copyWith(
          status: {{feature_name.pascalCase()}}sStatus.success,
          {{feature_name.camelCase()}}s: [...state.{{feature_name.camelCase()}}s, ...{{feature_name.camelCase()}}s],
          currentPage: state.currentPage + 1,
          hasReachedMax: {{feature_name.camelCase()}}s.length < pageSize,
          action: 'requested',
        ),
      ),
    );
  }

  Future<void> _onRefreshed({{feature_name.pascalCase()}}sRefreshed event, Emitter<{{feature_name.pascalCase()}}sState> emit,
  ) async {
    emit(const {{feature_name.pascalCase()}}sState());
    add({{feature_name.pascalCase()}}sRequested());
  }
}
