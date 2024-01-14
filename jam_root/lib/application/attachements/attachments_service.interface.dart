import 'dart:io';

abstract class Identifiable<T> {
  final T id;

  const Identifiable(this.id);
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
  });

  abstract final T bucket;
}
