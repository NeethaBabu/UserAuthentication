part of 'user_auth_bloc.dart';

abstract class UserAuthState {}

class UserAuthInitial extends UserAuthState {}

class UserAuthLoading extends UserAuthState {}

class UserAuthSuccess extends UserAuthState {}

class UserAuthError extends UserAuthState {
  final String message;
  UserAuthError(this.message);
}
