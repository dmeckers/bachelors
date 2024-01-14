// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/element.dart';

class ModelVisitor extends SimpleElementVisitor<void> {
  String className = '';
  Map<String, String> forTextFields = {};
  Map<String, String> booleans = {};
  Map<String, String> references = {};
  Map<String, String> lists = {};
  Map<String, String> numbers = {};
  Map<String, String> locations = {};
  Map<String, String> dates = {};
  Map<String, String> files = {};

  void clear() {
    className = '';
    forTextFields.clear();
    booleans.clear();
    references.clear();
    lists.clear();
    numbers.clear();
    locations.clear();
    dates.clear();
    files.clear();
  }

  @override
  void visitConstructorElement(ConstructorElement element) {
    final returnType = element.returnType.toString();
    className = returnType.replaceFirst('*', '');

    for (var parameter in element.parameters) {
      final parameterName = parameter.name;
      final parameterType = parameter.type.toString();
      if (parameterName.contains('json')) continue;

      if (parameterType.contains('File')) {
        files[parameterName] = parameterType;
        continue;
      }

      if ((parameterName.toLowerCase().contains('location') ||
              parameterName.toLowerCase().contains('url')) &&
          !parameterName.toLowerCase().contains('name')) {
        locations[parameterName] = parameterType;
        continue;
      }

      if (parameterType.toLowerCase().contains('date')) {
        dates[parameterName] = parameterType;
        continue;
      }

      if (parameterType.contains('String')) {
        forTextFields[parameterName] = parameterType;
      }

      if (parameterType.contains('bool')) {
        booleans[parameterName] = parameterType;
      }

      if (parameterType.contains('List')) {
        lists[parameterName] = parameterType;
      }

      if ((parameterType.contains('JUser') ||
              parameterType.contains('Model') ||
              parameterName.contains('id')) &&
          !parameterType.contains('List')) {
        references[parameterName] = parameterType;
      }

      if ((parameterType.contains('int') || parameterType.contains('double')) &&
          !parameterName.contains('id')) {
        numbers[parameterName] = parameterType;
      }
    }
  }
}
