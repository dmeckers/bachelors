import 'dart:async';
import 'dart:math';

enum ItemPositionInList { last, first, middle }

extension MapWithIndex<T> on List<T> {
  Iterable<E> mapWithIndex<E>(
    E Function(int index, T item, ItemPositionInList positionInList) map,
  ) sync* {
    for (var index = 0; index < length; index++) {
      final ItemPositionInList positionInList = index == 0
          ? ItemPositionInList.first
          : index == length - 1
              ? ItemPositionInList.last
              : ItemPositionInList.middle;
      yield map(index, this[index], positionInList);
    }
  }

  List<T> intersection(List<T> other) {
    return where((element) => other.contains(element)).toList();
  }

  List<T> sortCopy(int Function(T a, T b) compare) {
    var copy = List<T>.from(this);
    copy.sort(compare);
    return copy;
  }

  ///
  /// Watch out this method is not type safe
  /// it must have an id property
  ///
  List<T> intersectById(List<T> other) {
    return where((element) => other.any((otherElement) =>
        (otherElement as dynamic).id == (element as dynamic).id)).toList();
  }
}

extension FlattenExtension on List {
  List<Map<String, dynamic>> flattenByKey({required String key}) {
    return map<Map<String, dynamic>>((item) => item[key]).toList();
  }

  get second => this[1];
}

extension AsyncOperations<T> on List<T> {
  Future<Map<K, V>> asyncFoldIntoMap<K, V>(
    FutureOr<Map<K, V>> Function(Map<K, V>, T) combine,
  ) async {
    var result = <K, V>{};
    await Future.wait(
      map((item) async {
        var partialResult = await combine(result, item);
        result.addAll(partialResult);
      }),
      eagerError: true,
    );
    return result;
  }
}

List<double> randomDoubleArray() {
  final r = Random();
  return List.generate(100, (index) => r.nextDouble());
}
