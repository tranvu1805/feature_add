import 'dart:async';

import '../../../../../features/{{feature_name}}/domain/use_cases/use_cases.dart';
import '../../../../../entities/{{feature_name}}.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part '{{feature_name}}_event.dart';
part '{{feature_name}}_state.dart';

class {{feature_name}}Bloc extends Bloc<{{feature_name}}Event, {{feature_name}}State> {
  final Get{{feature_name}}UseCase _get{{feature_name}}UseCase;
  final Create{{feature_name}}UseCase _create{{feature_name}}UseCase;
  final Update{{feature_name}}UseCase _update{{feature_name}}UseCase;

{{feature_name}}Bloc({
    required Get{{feature_name}}UseCase get{{feature_name}}UseCase,
    required Create{{feature_name}}UseCase create{{feature_name}}UseCase,
    required Update{{feature_name}}UseCase update{{feature_name}}UseCase,
  }) : _get{{feature_name}}UseCase = get{{feature_name}}UseCase,
       _create{{feature_name}}UseCase = create{{feature_name}}UseCase,
       _update{{feature_name}}UseCase = update{{feature_name}}UseCase,
       super({{feature_name}}Initial()) {
    on<{{feature_name}}Requested>(_on{{feature_name}}Requested);
    on<{{feature_name}}Created>(_onCreated);
    on<{{feature_name}}Updated>(_onUpdated);
  }

  Future<void> _on{{feature_name}}Requested(
{{feature_name}}Requested event,
    Emitter<{{feature_name}}State> emit,
  ) async {
    emit({{feature_name}}InProgress());
    final result = await _get{{feature_name}}UseCase(event.id);
    result.fold(
      (failure) => emit({{feature_name}}Failure(error: failure.message)),
      ({{feature_name.camelCase()}}) => emit({{feature_name}}Success({{feature_name.camelCase()}}: {{feature_name.camelCase()}})),
    );
  }

  Future<void> _onCreated({{feature_name}}Created event, Emitter<{{feature_name}}State> emit) async {
    emit({{feature_name}}InProgress());
    final result = await _create{{feature_name}}UseCase(event.param);
    result.fold((failure) => emit({{feature_name}}Failure(error: failure.message)), (_) {
      emit({{feature_name}}CreateSuccess());
    });
  }

  Future<void> _onUpdated({{feature_name}}Updated event, Emitter<{{feature_name}}State> emit) async {
    emit({{feature_name}}InProgress());
    final result = await _update{{feature_name}}UseCase(event.param);
    result.fold((failure) => emit({{feature_name}}Failure(error: failure.message)), (_) {
      emit({{feature_name}}UpdateSuccess());
    });
  }
}
