import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/auth_services.dart';

part 'auth_provider.g.dart';

@riverpod
AuthServices authService(AuthServiceRef ref) {
  return AuthServices();
}
