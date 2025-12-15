import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/data/data.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const t{{feature_name.pascalCase()}}Model = {{feature_name.pascalCase()}}Model.empty();

  test('should return a valid value when call toJson', () {
    final result = t{{feature_name.pascalCase()}}Model.toJson();
    final expectedJson = {};
    expect(result, expectedJson);
  });

  test('should return a valid value when call toJsonForCreate', () {
    final result = t{{feature_name.pascalCase()}}Model.toJsonForCreate();
    final expectedJson = {};
    expect(result, expectedJson);
  });

  test('should return a valid value when call fromJson', () {
    final json = {};
    final result = {{feature_name.pascalCase()}}Model.fromJson(json);
    final expectedModel = const {{feature_name.pascalCase()}}Model();
    expect(result, expectedModel);
  });

  test('should return a valid entity when call toEntity', () {
    final result = t{{feature_name.pascalCase()}}Model.toEntity();
    final expectedEntity = const {{feature_name.pascalCase()}}();
    expect(result, expectedEntity);
  });
}
