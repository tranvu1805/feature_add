import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/domain.dart';

part '{{feature_name.snakeCase()}}_event.dart';
part '{{feature_name.snakeCase()}}_state.dart';

class {{feature_name.pascalCase()}}Bloc extends Bloc<{{feature_name.pascalCase()}}Event, {{feature_name.pascalCase()}}State> {
  final Get{{feature_name.pascalCase()}}UseCase _get{{feature_name.pascalCase()}}UseCase;
  final Create{{feature_name.pascalCase()}}UseCase _create{{feature_name.pascalCase()}}UseCase;
  final Update{{feature_name.pascalCase()}}UseCase _update{{feature_name.pascalCase()}}UseCase;
  final Delete{{feature_name.pascalCase()}}UseCase _delete{{feature_name.pascalCase()}}UseCase;

{{feature_name.pascalCase()}}Bloc({
    required Get{{feature_name.pascalCase()}}UseCase get{{feature_name.pascalCase()}}UseCase,
    required Create{{feature_name.pascalCase()}}UseCase create{{feature_name.pascalCase()}}UseCase,
    required Update{{feature_name.pascalCase()}}UseCase update{{feature_name.pascalCase()}}UseCase,
    required Delete{{feature_name.pascalCase()}}UseCase delete{{feature_name.pascalCase()}}UseCase,
  }) : _get{{feature_name.pascalCase()}}UseCase = get{{feature_name.pascalCase()}}UseCase,
       _create{{feature_name.pascalCase()}}UseCase = create{{feature_name.pascalCase()}}UseCase,
       _update{{feature_name.pascalCase()}}UseCase = update{{feature_name.pascalCase()}}UseCase,
       _delete{{feature_name.pascalCase()}}UseCase = delete{{feature_name.pascalCase()}}UseCase,
       super({{feature_name.pascalCase()}}Initial()) {
    on<{{feature_name.pascalCase()}}Requested>(_on{{feature_name.pascalCase()}}Requested);
    on<{{feature_name.pascalCase()}}Created>(_onCreated);
    on<{{feature_name.pascalCase()}}Updated>(_onUpdated);
    on<{{feature_name.pascalCase()}}Deleted>(_onDeleted);
  }

  Future<void> _on{{feature_name.pascalCase()}}Requested(
{{feature_name.pascalCase()}}Requested event,
    Emitter<{{feature_name.pascalCase()}}State> emit,
  ) async {
    emit({{feature_name.pascalCase()}}InProgress());
    final result = await _get{{feature_name.pascalCase()}}UseCase(event.id);
    result.fold(
      (failure) => emit({{feature_name.pascalCase()}}Failure(error: failure.message)),
      ({{feature_name.camelCase()}}) => emit({{feature_name.pascalCase()}}Success({{feature_name.camelCase()}}: {{feature_name.camelCase()}})),
    );
  }

  Future<void> _onCreated({{feature_name.pascalCase()}}Created event, Emitter<{{feature_name.pascalCase()}}State> emit) async {
    emit({{feature_name.pascalCase()}}InProgress());
    final result = await _create{{feature_name.pascalCase()}}UseCase(event.param);
    result.fold((failure) => emit({{feature_name.pascalCase()}}Failure(error: failure.message)), (_) {
      emit({{feature_name.pascalCase()}}CreateSuccess());
    });
  }

  Future<void> _onUpdated({{feature_name.pascalCase()}}Updated event, Emitter<{{feature_name.pascalCase()}}State> emit) async {
    emit({{feature_name.pascalCase()}}InProgress());
    final result = await _update{{feature_name.pascalCase()}}UseCase(event.param);
    result.fold((failure) => emit({{feature_name.pascalCase()}}Failure(error: failure.message)), (_) {
      emit({{feature_name.pascalCase()}}UpdateSuccess());
    });
  }

  Future<void> _onDeleted({{feature_name.pascalCase()}}Deleted event, Emitter<{{feature_name.pascalCase()}}State> emit) async {
    emit({{feature_name.pascalCase()}}InProgress());
    final result = await _delete{{feature_name.pascalCase()}}UseCase(event.id);
    result.fold((failure) => emit({{feature_name.pascalCase()}}Failure(error: failure.message)), (_) {
    emit({{feature_name.pascalCase()}}DeleteSuccess());
    });
  }
}
