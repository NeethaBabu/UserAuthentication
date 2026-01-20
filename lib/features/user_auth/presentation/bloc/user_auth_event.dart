part of 'user_auth_bloc.dart';

abstract class UserAuthEvent {}

class LoginRequested extends UserAuthEvent {
  final String email;
  final String password;

  LoginRequested(this.email, this.password);
}

class RegisterRequested extends UserAuthEvent {
  final String email;
  final String password;

  RegisterRequested(this.email, this.password);
}

class UserLogoutRequested extends UserAuthEvent {}
