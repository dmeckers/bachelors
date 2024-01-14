class UnauthorizedException implements Exception {
  const UnauthorizedException(this.message, [this.stackTrace]);

  final String message;
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'Authentication error: $message';
  }
}
