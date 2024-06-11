import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:rxdart/subjects.dart';

mixin MapWidgetStateLocationActions {
  BehaviorSubject<MapWidgetState> get state;

  MapData? get mapData$;
}

mixin MapWidgetStateActions {
  BehaviorSubject<MapWidgetState> get state;

  MapData? get mapData$;
}
