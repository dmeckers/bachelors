import 'dart:io';

abstract class Identifiable<T> {
  final T id;

  const Identifiable(this.id);
}

extension IdentifiableListExtension<T extends Identifiable> on List<T> {
  ///
  /// Watch out this method is not type safe
  /// it must have an id property
  ///
  List<T> intersectById(List<T> other) {
    return where(
      (element) => other.any((otherElement) => otherElement.id == element.id),
    ).toList();
  }

  List<T> replaceIntersected({
    required List<T> toReplaceWith,
    T Function(T el)? tap,
  }) {
    final list = List<T>.from(this, growable: true);

    for (var i = 0; i < list.length; i++) {
      final el = list[i];
      final index = toReplaceWith.indexWhere((element) => element.id == el.id);
      if (index != -1) {
        list[i] = tap?.call(toReplaceWith[index]) ?? toReplaceWith[index];
      }
    }

    return list;
  }
}

abstract class BucketInterface<T extends Identifiable> {
  final String path;

  final bool isStatic;
  final bool isOfUserDomain;

  String getFullPath(String? userId, T? model);

  const BucketInterface(
    this.path,
    this.isStatic,
    this.isOfUserDomain,
  );
}

abstract class AttachmentServiceInterface<T extends BucketInterface,
    M extends Identifiable> {
  Future<String> upload({
    required File file,
    Identifiable? model,
  });
  Future<void> delete(String filename, [M? model]);
  Future<List> list({String? userId, M? model});

  String getLink({
    required String filename,
    String? userId,
    Identifiable? model,
    int? width,
    int? height,
  });

  abstract final T bucket;
}
