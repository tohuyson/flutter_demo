class AppException implements Exception {
  final String? message;
  final int? statusCode;
  final String? identifier;
  final String? which;

  AppException({required this.message, required this.statusCode, this.identifier, this.which});

  @override
  String toString() {
    return 'AppException{message: $message, statusCode: $statusCode, identifier: $identifier, which: $which}';
  }
}
