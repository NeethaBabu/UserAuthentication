import 'firebase_auth_services.dart';

class AuthRepository {
  final FirebaseAuthService service;

  AuthRepository(this.service);

  Future<void> login(String email, String password) =>
      service.login(email, password);

  Future<void> register(String email, String password) =>
      service.register(email, password);
  Future<void> logout() => service.logout();
}
