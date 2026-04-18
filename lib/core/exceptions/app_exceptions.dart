class AppException implements Exception {
  final String message;
  final String? code;

  AppException({required this.message, this.code});

  @override
  String toString() => message;
}

class FirebaseException extends AppException {
  FirebaseException({required String message, String? code})
    : super(message: message, code: code);
}

class HiveException extends AppException {
  HiveException({required String message, String? code})
    : super(message: message, code: code);
}

class AuthException extends AppException {
  AuthException({required String message, String? code})
    : super(message: message, code: code);
}
