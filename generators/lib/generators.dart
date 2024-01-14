library generators;

import 'package:build/build.dart';
import 'package:generators/src/view_model.generator.dart';
import 'package:source_gen/source_gen.dart';

export 'src/src.dart';

Builder generateViewModel(BuilderOptions options) => PartBuilder(
      [ViewModelGenerator()],
      '.j-gen.dart',
    );
