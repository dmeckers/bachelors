// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generators/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class ViewModelGenerator extends GeneratorForAnnotation<ViewModelAnnotation> {
  String className = "";
  final fields = {};

  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    final buffer = StringBuffer();
    visitor.className.indexOf("Model");
    className = _generateClassName(visitor.className);

    final withHook = annotation.read('withHook').boolValue;
    final withStateNotifier = annotation.read('withStateNotifier').boolValue;

    buffer.writeln(
        '// ***************************************************************************');
    buffer.writeln('// Author: Dmitry Mecker https://github.com/dmeckers');
    buffer.writeln(
        '// ***************************************************************************');
    buffer.writeln("\n");

    buffer.writeln("final class $className {");
    buffer.writeln("\n");
    _generateTextFormFields(visitor, buffer);
    buffer.writeln("\n");
    _generateRestOfTheFields(visitor, buffer);
    buffer.writeln("\n");
    _generateContructor(visitor, buffer);
    buffer.writeln("\n");
    _generateFactoryConstructor(visitor, buffer);
    buffer.writeln("\n");
    _generateModelFactoryConstructor(visitor, buffer);
    buffer.writeln("\n");
    _generateCopyWithMethod(visitor, buffer);
    buffer.writeln("\n");
    _generateDisposeMethod(visitor, buffer);
    buffer.writeln("\n");
    _generateCastToModelMethod(visitor, buffer);
    buffer.writeln("\n");
    // _generateStringToDateTimeFunction(buffer);
    buffer.writeln("}");

    if (withHook) _generateHook(visitor, buffer);
    if (withStateNotifier) {
      _generateStateNotifier(visitor, buffer);
      _generateStateNotifierFreshModel(visitor, buffer);
    }

    visitor.clear();
    fields.clear();

    return buffer.toString();
  }

  void _generateCastToModelMethod(ModelVisitor visitor, StringBuffer buffer) {
    buffer.writeln('${visitor.className} castToModel() {');

    buffer.writeln('return ${visitor.className}(');

    for (var element in visitor.references.entries) {
      buffer.writeln('${element.key}: ${element.key},');
    }

    for (var element in visitor.booleans.entries) {
      buffer.writeln('${element.key}: ${element.key},');
    }

    for (var element in visitor.lists.entries) {
      buffer.writeln('${element.key}: ${element.key},');
    }

    for (var element in visitor.numbers.entries) {
      buffer.writeln('${element.key}: ${element.key},');
    }

    for (var element in visitor.locations.entries) {
      buffer.writeln('${element.key}: ${element.key},');
    }

    for (var element in visitor.dates.entries) {
      buffer.writeln('${element.key}: ${element.key} ?? DateTime.now(),');
    }

    //it mostly relies on fact that files are nullable
    for (var element in visitor.files.entries) {
      buffer.writeln('${element.key}: ${element.key},');
    }

    for (var element in visitor.forTextFields.entries) {
      if (element.key.toLowerCase().contains('date')) {
        buffer.writeln(
            '${element.key}: _stringToDateTime(${element.key}FormModel.controller!.text),');
        continue;
      }
      buffer
          .writeln('${element.key}: ${element.key}FormModel.controller!.text,');
    }

    buffer.writeln(');');

    buffer.writeln('}');
  }

  // _generateStringToDateTimeFunction(StringBuffer buffer) {
  //   buffer.writeln("""
  //     DateTime _stringToDateTime(String date) {
  //       final dateParts = date.split('/');
  //       final day = int.parse(dateParts[0]);
  //       final month = int.parse(dateParts[1]);
  //       final year = int.parse(dateParts[2]);
  //       return DateTime(year, month, day);
  //     }
  //   """);
  // }

  void _generateTextFormFields(ModelVisitor visitor, StringBuffer buffer) {
    visitor.forTextFields.forEach((key, value) {
      final fieldName = "${key}FormModel";
      fields[fieldName] = 'JamBaseFormModel';

      buffer.writeln('final JamBaseFormModel $fieldName;');
    });

    if (visitor.forTextFields.keys
        .any((element) => element.toLowerCase().contains('password'))) {
      buffer.writeln('bool? passwordVisibility;');
    }
  }

  void _generateRestOfTheFields(ModelVisitor visitor, StringBuffer buffer) {
    visitor.booleans
        .forEach((key, value) => buffer.writeln('final bool $key;'));

    visitor.references
        .forEach((key, value) => buffer.writeln('final $value $key;'));

    visitor.lists
        .forEach((key, value) => buffer.writeln('final $value $key ;'));

    visitor.numbers
        .forEach((key, value) => buffer.writeln('final $value $key;'));

    visitor.locations
        .forEach((key, value) => buffer.writeln('final $value $key;'));

    visitor.dates.forEach((key, value) =>
        buffer.writeln('final ${value.split('?').first}? $key;'));

    visitor.files.forEach((key, value) => buffer.writeln('final $value $key;'));
  }

  void _generateContructor(ModelVisitor visitor, StringBuffer buffer) {
    final references =
        visitor.references.entries.map((e) => 'this.${e.key}').join(',\n');
    final textFields = visitor.forTextFields.entries
        .map((e) => 'required this.${e.key}FormModel')
        .join(',\n');
    final booleans = visitor.booleans.entries
        .map((e) => 'this.${e.key} = false')
        .join(',\n');
    final numbers =
        visitor.numbers.entries.map((e) => 'this.${e.key} = -1').join(',\n');
    final lists = visitor.lists.entries
        .map((e) => 'this.${e.key} = const []')
        .join(',\n');
    final locations = visitor.locations.entries
        .map((e) => 'this.${e.key} = \'\'')
        .join(',\n');
    final dates = visitor.dates.entries.map((e) => 'this.${e.key}').join(',\n');
    final files = visitor.files.entries.map((e) => 'this.${e.key}').join(',\n');

    buffer.writeln("""
      const $className({
        ${references.isNotEmpty ? '$references,' : ''}
        ${textFields.isNotEmpty ? '$textFields,' : ''}
        ${booleans.isNotEmpty ? '$booleans,' : ''}
        ${numbers.isNotEmpty ? '$numbers,' : ''}
        ${lists.isNotEmpty ? '$lists,' : ''}
        ${locations.isNotEmpty ? '$locations,' : ''}
        ${dates.isNotEmpty ? '$dates,' : ''}
        ${files.isNotEmpty ? '$files,' : ''}
        });
      """);
  }

  _generateModelFactoryConstructor(ModelVisitor visitor, StringBuffer buffer) {
    buffer
        .writeln('factory $className.fromModel(${visitor.className} model) {');
    buffer.writeln('return $className(');
    visitor.forTextFields.forEach((key, value) {
      final validator = _generateValidator({key: value}.entries.first);
      buffer.writeln("""${key}FormModel: JamBaseFormModel.generate(
          labelText: '${_capitalizeAndSplitWords(key)}',
          initValue: model.$key,
          validator: $validator
          ),""");
    });

    visitor.booleans.forEach((key, value) {
      buffer.writeln("$key: model.$key,");
    });

    visitor.references.forEach((key, value) {
      buffer.writeln("$key: model.$key,");
    });

    visitor.lists.forEach((key, value) {
      buffer.writeln("$key: model.$key,");
    });

    visitor.numbers.forEach((key, value) {
      buffer.writeln("$key: model.$key,");
    });

    visitor.locations.forEach((key, value) {
      buffer.writeln("$key: model.$key,");
    });

    visitor.dates.forEach((key, value) {
      buffer.writeln("$key: model.$key,");
    });

    visitor.files.forEach((key, value) {
      buffer.writeln("$key: model.$key,");
    });

    buffer.writeln(");");
    buffer.writeln("}");
  }

  void _generateDisposeMethod(ModelVisitor visitor, StringBuffer buffer) {
    buffer.writeln("void dispose() {");

    visitor.forTextFields.forEach((key, value) {
      buffer.writeln("${key}FormModel.dispose();");
    });

    buffer.writeln("}");
  }

  void _generateFactoryConstructor(ModelVisitor visitor, StringBuffer buffer) {
    //TODO Bring context when S.context() will be implemented
    //BuildContext context
    buffer.writeln("factory $className.generate() {");
    buffer.writeln("return $className(");

    final factoryParameters = visitor.forTextFields.entries
        .map((e) {
          final fieldName = "${e.key}FormModel";
          //TODO replace with S.context()
          final labelText = _capitalizeAndSplitWords(e.key);
          final validator = _generateValidator(e);

          return """
            $fieldName: JamBaseFormModel.generate(
            labelText: '$labelText',
            validator: $validator)
            """;
        })
        .where((element) => element.isNotEmpty)
        .join(',\n');

    buffer.writeln(factoryParameters);

    buffer.writeln(");");
    buffer.writeln("}");
  }

  String _generateValidator(MapEntry<String, dynamic> e) {
    final notRequired = (e.value as String).contains('?');
    final isPassword = e.key.contains('password');
    final isEmail = e.key.contains('email');
    final isUrl = e.key.contains('url');
    const emailPattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
    const urlPattern =
        r'^(?:http|https):\/\/[\w\-_]+(?:\.[\w\-_]+)+[\w\-.,@?^=%&:\/~+#]*$';

    final validator = """
    (value){
      ${!notRequired ? 'if((value as String).isEmpty) {return \'${_capitalizeAndSplitWords(e.key)} cannot be empty\';}' : ''}
      ${isPassword ? 'if((value as String).length < 6) {return \'${e.key} must be at least 6 characters long\';}' : ''}
      ${isEmail ? 'if(!RegExp(r\'$emailPattern\').hasMatch(value)) {return \'Invalid email format\';}' : ''}
      ${isUrl ? 'if(!RegExp(r\'$urlPattern\').hasMatch(value)) {return \'${e.key} must be a valid url\';}' : ''}
      return null;
    }
  """;

    return validator;
  }

  String _capitalizeAndSplitWords(String key) {
    final words = key.split(RegExp(r'(?=[A-Z])'));
    final capitalizedWords = words.map((word) {
      final firstLetter = word.substring(0, 1).toUpperCase();
      final remainingLetters = word.substring(1);
      return '$firstLetter$remainingLetters';
    });
    return capitalizedWords.join(' ');
  }

  String _generateClassName(String originalClassName) {
    final modelClauseIndex = originalClassName.indexOf("Model");

    if (modelClauseIndex == -1) {
      return "${originalClassName}ViewModel";
    }

    return originalClassName.replaceRange(
        modelClauseIndex, modelClauseIndex + 5, "ViewModel");
  }

  void _generateHook(ModelVisitor visitor, StringBuffer buffer) {
    buffer.writeln(
        '$className use$className() { return use(const _${className}Hook()); }');
    buffer.writeln('class _${className}Hook extends Hook<$className> {');
    buffer.writeln('const _${className}Hook();');
    buffer.writeln('@override');
    buffer.writeln(
        '_${className}HookState createState() => _${className}HookState();');
    buffer.writeln('}');
    buffer.writeln(
        'class _${className}HookState extends HookState<$className, _${className}Hook> {');
    buffer.writeln('late $className model;');
    buffer.writeln('@override');
    buffer.writeln('void initHook() {');
    buffer.writeln('super.initHook();');
    buffer.writeln('model = $className.generate();');
    buffer.writeln('}');
    buffer.writeln('@override');
    buffer.writeln('$className build(BuildContext context) {');
    buffer.writeln('return model;');
    buffer.writeln('}');
    buffer.writeln('@override');
    buffer.writeln('void dispose() {');
    buffer.writeln('model.dispose();');
    buffer.writeln('super.dispose();');
    buffer.writeln('}');
    buffer.writeln('}');
  }

  _getGenericType(String type) {
    final startIndex = type.indexOf('<');
    final endIndex = type.indexOf('>');

    return type.substring(startIndex + 1, endIndex);
  }

  _capitalizeFirstLetter(String word) {
    final firstLetter = word.substring(0, 1).toUpperCase();
    final remainingLetters = word.substring(1);
    return '$firstLetter$remainingLetters';
  }

  _lowerCaseFirstLetter(String word) {
    final firstLetter = word.substring(0, 1).toLowerCase();
    final remainingLetters = word.substring(1);
    return '$firstLetter$remainingLetters';
  }

  _generateStateNotifier(ModelVisitor visitor, StringBuffer buffer) {
    buffer.writeln('\n');
    buffer.writeln(
        'final class ${className}StateNotifier extends StateNotifier<$className> {');
    buffer.writeln('${className}StateNotifier(super.state);');

    for (var element in visitor.lists.entries) {
      buffer.writeln(
          'void add${_capitalizeFirstLetter(element.key)}(${_getGenericType(element.value)} ${element.key}) {');
      buffer.writeln(
          'state = state.copyWith(${element.key}: [...state.${element.key}, ${element.key}]);');
      buffer.writeln('}');
      buffer.writeln('\n');
      buffer.writeln(
          'void remove${_capitalizeFirstLetter(element.key)}(${_getGenericType(element.value)} ${element.key}) {');
      buffer.writeln(
          'state = state.copyWith(${element.key}: state.${element.key}.where((element) => element != ${element.key}).toList());');
      buffer.writeln('}');
      buffer.writeln('\n');
    }

    for (var element in visitor.booleans.entries) {
      buffer.writeln(
          'void update${_capitalizeFirstLetter(element.key)}(bool value) {');
      buffer.writeln('state = state.copyWith(${element.key}: value);');
      buffer.writeln('}');
      buffer.writeln('\n');
    }

    for (var element in visitor.references.entries) {
      buffer.writeln(
          'void update${_capitalizeFirstLetter(element.key)}(${element.value} value) {');
      buffer.writeln('state = state.copyWith(${element.key}: value);');
      buffer.writeln('}');
      buffer.writeln('\n');
    }

    for (var element in visitor.numbers.entries) {
      buffer.writeln(
          'void update${_capitalizeFirstLetter(element.key)}(${element.value} value) {');
      buffer.writeln('state = state.copyWith(${element.key}: value);');
      buffer.writeln('}');
      buffer.writeln('\n');
    }

    for (var element in visitor.locations.entries) {
      buffer.writeln(
          'void update${_capitalizeFirstLetter(element.key)}(${element.value} value) {');
      buffer.writeln('state = state.copyWith(${element.key}: value);');
      buffer.writeln('}');
      buffer.writeln('\n');
    }

    for (var element in visitor.dates.entries) {
      buffer.writeln(
          'void update${_capitalizeFirstLetter(element.key)}(${element.value} value) {');
      buffer.writeln('state = state.copyWith(${element.key}: value);');
      buffer.writeln('}');
      buffer.writeln('\n');
    }

    for (var element in visitor.files.entries) {
      buffer.writeln(
          'void update${_capitalizeFirstLetter(element.key)}(${element.value} value) {');
      buffer.writeln(
          'state = state.copyWith(${element.key}: value  ?? File(\' \'));');
      buffer.writeln('}');
      buffer.writeln('\n');
    }

    buffer.writeln('}');

    buffer.writeln('\n');

    buffer.writeln(
        'final ${_lowerCaseFirstLetter(className)}StateProvider = StateNotifierProvider.family.autoDispose<${className}StateNotifier , $className , ${visitor.className}>((ref , model) {');
    buffer.writeln(
        'return ${className}StateNotifier($className.fromModel(model));');
    buffer.writeln('});');
  }

  _generateStateNotifierFreshModel(ModelVisitor visitor, StringBuffer buffer) {
    buffer.writeln('\n');
    buffer.writeln(
        'final class Fresh${className}StateNotifier extends StateNotifier<$className> {');
    buffer.writeln('Fresh${className}StateNotifier(super.state);');

    for (var element in visitor.lists.entries) {
      buffer.writeln(
          'void add${_capitalizeFirstLetter(element.key)}(${_getGenericType(element.value)} ${element.key}) {');
      buffer.writeln(
          'state = state.copyWith(${element.key}: [...state.${element.key}, ${element.key}]);');
      buffer.writeln('}');
      buffer.writeln('\n');
      buffer.writeln(
          'void remove${_capitalizeFirstLetter(element.key)}(${_getGenericType(element.value)} ${element.key}) {');
      buffer.writeln(
          'state = state.copyWith(${element.key}: state.${element.key}.where((element) => element != ${element.key}).toList());');
      buffer.writeln('}');
      buffer.writeln('\n');
    }

    for (var element in visitor.booleans.entries) {
      buffer.writeln(
          'void update${_capitalizeFirstLetter(element.key)}(bool value) {');
      buffer.writeln('state = state.copyWith(${element.key}: value);');
      buffer.writeln('}');
      buffer.writeln('\n');
    }

    for (var element in visitor.references.entries) {
      buffer.writeln(
          'void update${_capitalizeFirstLetter(element.key)}(${element.value} value) {');
      buffer.writeln('state = state.copyWith(${element.key}: value);');
      buffer.writeln('}');
      buffer.writeln('\n');
    }

    for (var element in visitor.numbers.entries) {
      buffer.writeln(
          'void update${_capitalizeFirstLetter(element.key)}(${element.value} value) {');
      buffer.writeln('state = state.copyWith(${element.key}: value);');
      buffer.writeln('}');
      buffer.writeln('\n');
    }

    for (var element in visitor.locations.entries) {
      buffer.writeln(
          'void update${_capitalizeFirstLetter(element.key)}(${element.value} value) {');
      buffer.writeln('state = state.copyWith(${element.key}: value);');
      buffer.writeln('}');
      buffer.writeln('\n');
    }

    for (var element in visitor.dates.entries) {
      buffer.writeln(
          'void update${_capitalizeFirstLetter(element.key)}(${element.value} value) {');
      buffer.writeln('state = state.copyWith(${element.key}: value);');
      buffer.writeln('}');
      buffer.writeln('\n');
    }

    for (var element in visitor.files.entries) {
      buffer.writeln(
          'void update${_capitalizeFirstLetter(element.key)}(${element.value} value) {');
      buffer.writeln(
          'state = state.copyWith(${element.key}: value  ?? File(\' \'));');
      buffer.writeln('}');
      buffer.writeln('\n');
    }

    buffer.writeln('}');

    buffer.writeln('\n');

    buffer.writeln(
        'final fresh${className}StateProvider = StateNotifierProvider.autoDispose<Fresh${className}StateNotifier , $className>((ref) {');
    buffer.writeln(
        'return Fresh${className}StateNotifier($className.generate());');
    buffer.writeln('});');
  }

  _generateCopyWithMethod(ModelVisitor visitor, StringBuffer buffer) {
    buffer.writeln('$className copyWith({');
    fields.forEach((key, value) {
      buffer.writeln(
          '${(value as String).contains('?') ? value : '$value?'} $key,');
    });

    for (var map in [
      visitor.booleans,
      visitor.references,
      visitor.lists,
      visitor.numbers,
      visitor.locations,
      visitor.dates,
      visitor.files
    ]) {
      map.forEach((key, value) {
        buffer.writeln('${(value).split('?').first}? $key,');
      });
    }

    buffer.writeln('}) {');
    buffer.writeln('return $className(');
    fields.forEach((key, value) {
      buffer.writeln('$key: $key ?? this.$key,');
    });

    for (var map in [
      visitor.booleans,
      visitor.references,
      visitor.lists,
      visitor.numbers,
      visitor.locations,
      visitor.dates,
      visitor.files
    ]) {
      map.forEach((key, value) {
        buffer.writeln('$key: $key ?? this.$key,');
      });
    }

    buffer.writeln(');');
    buffer.writeln('}');
  }
}
