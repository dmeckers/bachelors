class EmailUsedException implements Exception {
  const EmailUsedException([this.message, this.stackTrace]);

  final String? message;
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'This email is already in use.';
  }
}
