import 'dart:convert';
import 'dart:io';
import 'package:mason/mason.dart';
import 'package:yaml/yaml.dart';

void run(HookContext context) async {
  final pubspecFile = File('pubspec.yaml');

  if (!pubspecFile.existsSync()) {
    context.logger.err('pubspec.yaml not found');
    exit(1);
  }

  final content = utf8
      .decode(pubspecFile.readAsBytesSync(), allowMalformed: true)
      .replaceAll('\uFEFF', '');

  final yaml = loadYaml(content);
  final projectName = yaml['name'];

  if (projectName == null) {
    context.logger.err('Cannot find project name in pubspec.yaml');
    exit(1);
  }

  context.vars['project_name'] = projectName;
}
