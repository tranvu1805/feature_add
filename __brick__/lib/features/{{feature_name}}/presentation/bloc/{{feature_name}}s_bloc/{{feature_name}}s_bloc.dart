import 'dart:async';

import '../../../../../core/constants/app.dart';
import '../../../../../features/{{feature_name}}/domain/use_cases/use_cases.dart';
import '../../../../../entities/{{feature_name}}.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '{{feature_name}}s_event.dart';
part '{{feature_name}}s_state.dart';

class {{feature_name}}sBloc extends Bloc<{{feature_name}}sEvent, {{feature_name}}sState> {
  final Get{{feature_name}}sUseCase _get{{feature_name}}sUseCase;

  {{feature_name}}sBloc({required Get{{feature_name}}sUseCase get{{feature_name}}sUseCase,})
    : _get{{feature_name}}sUseCase = get{{feature_name}}sUseCase,
       super(const {{feature_name}}sState()) {
    on<{{feature_name}}sRequested>(_onRequested);
    on<{{feature_name}}sRefreshed>(_onRefreshed);
  }

  Future<void> _onRequested({{feature_name}}sRequested event,
    Emitter<{{feature_name}}sState> emit,
  ) async {
    if (state.hasReachedMax || state.status == {{feature_name}}sStatus.loading) return;
    if (state.currentPage == 1) {
      emit(state.copyWith(status: {{feature_name}}sStatus.loading));
    }
    final result = await _get{{feature_name}}sUseCase(
      event.params.copyWith(page: state.currentPage),
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: {{feature_name}}sStatus.failure,
          error: failure.message,
          action: 'requested',
        ),
      ),
      ({{feature_name.camelCase()}}s) => emit(
        state.copyWith(
          status: {{feature_name}}sStatus.success,
          {{feature_name.camelCase()}}s: [...state.{{feature_name.camelCase()}}s, ...{{feature_name.camelCase()}}s],
          currentPage: state.currentPage + 1,
          hasReachedMax: {{feature_name}}s.length < pageSize,
          action: 'requested',
        ),
      ),
    );
  }

  Future<void> _onRefreshed({{feature_name}}sRefreshed event, Emitter<{{feature_name}}sState> emit,
  ) async {
    emit(const {{feature_name}}sState());
    add({{feature_name}}sRequested());
  }
}
