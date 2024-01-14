class RateLimitException implements Exception {
  const RateLimitException([this.message, this.stackTrace]);

  final String? message;
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'RateLimitException: $message';
  }
}
