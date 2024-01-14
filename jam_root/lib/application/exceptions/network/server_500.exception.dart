class ServerException implements Exception {
  const ServerException([this.message, this.stackTrace]);

  final String? message;
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'Something wrong on our side. Please try again later.';
  }
}
