import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/auth_repository.dart';

part 'user_auth_event.dart';

part 'user_auth_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  final AuthRepository repository;

  UserAuthBloc(this.repository) : super(UserAuthInitial()) {
    on<LoginRequested>(_login);
    on<RegisterRequested>(_register);
    on<UserLogoutRequested>(_logout);
  }

  Future<void> _login(LoginRequested e, Emitter<UserAuthState> emit) async {
    emit(UserAuthLoading());
    try {
      await repository.login(e.email, e.password);
      emit(UserAuthSuccess());
    } catch (e) {
      emit(UserAuthError('Invalid email or password'));
    }
  }

  Future<void> _register(
    RegisterRequested e,
    Emitter<UserAuthState> emit,
  ) async {
    emit(UserAuthLoading());
    try {
      await repository.register(e.email, e.password);
      emit(UserAuthSuccess());
    } catch (e) {
      emit(UserAuthError('Email already exists or password is weak'));
    }
  }
  Future<void> _logout(
      UserLogoutRequested event,
      Emitter<UserAuthState> emit,
      ) async {
    emit(UserAuthLoading());
    try {
      await repository.logout();
      emit(UserAuthInitial());
    } catch (e) {
      emit(UserAuthError('Logout failed. Please try again.'));
    }
  }

}
