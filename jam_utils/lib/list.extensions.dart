import 'dart:async';
import 'dart:math';

enum ItemPositionInList { last, first, middle }

extension SetExtensions<T> on Set<T> {
  Set<T> addIfNotNull(T? item) {
    if (item != null) {
      add(item);
    }
    return this;
  }
}

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
}

extension FlattenExtension on List {
  List<Map<String, dynamic>> flattenByKey({required String key}) {
    return map<Map<String, dynamic>>((item) => item[key]).toList();
  }

  dublicate(int times) {
    return List.generate(times, (_) => this)
        .expand((element) => element)
        .toList();
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
