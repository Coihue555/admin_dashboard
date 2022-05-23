part of 'login_bloc.dart';

@immutable

class LoginState {

  final bool isWorking;
  final String accion;
  final String error;
  final String campoError;
  final String email;
  final String password;
  final String token;
  final bool isLogged;
  final AuthStatus authStatus;

  const LoginState({
      this.isWorking = false,
      this.accion = '',
      this.error = '',
      this.campoError = '',
      this.email = '',
      this.password = '',
      this.token = '',
      this.isLogged = false,
      AuthStatus? authStatus,
    }): authStatus= authStatus ?? AuthStatus.notAuthenticated;

    LoginState copyWith({
      bool? isWorking,
      String? accion,
      String? error,
      String? campoError,
      String? email,
      String? password,
      String? token,
      bool? isLogged,
      AuthStatus? authStatus,
    }) => 
      LoginState(
        isWorking: isWorking ?? this.isWorking,
        accion: accion ?? this.accion,
        error: error ?? this.error,
        campoError: campoError ?? this.campoError,
        email: email ?? this.email,
        password: password ?? this.password,
        token: token ?? this.token,
        isLogged: isLogged ?? this.isLogged,
        authStatus: authStatus ?? this.authStatus
      );





}
