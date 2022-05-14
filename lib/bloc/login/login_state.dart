part of 'login_bloc.dart';

@immutable
class LoginState {

  final bool isWorking;
  final String accion;
  final String error;
  final String campoError;
  final String email;
  final String password;
  final GlobalKey<FormState> formKey;

    LoginState({
      this.isWorking = false,
      this.accion = '',
      this.error = '',
      this.campoError = '',
      this.email = '',
      this.password = '',
      GlobalKey<FormState>? formKey,

    }): formKey = formKey ?? GlobalKey<FormState>();

    LoginState copyWith({
      bool? isWorking,
      String? accion,
      String? error,
      String? campoError,
      String? email,
      String? password,
      GlobalKey<FormState>? formKey,
    }) => 
      LoginState(
        isWorking: isWorking ?? this.isWorking,
        accion: accion ?? this.accion,
        error: error ?? this.error,
        campoError: campoError ?? this.campoError,
        email: email ?? this.email,
        password: password ?? this.password,
        formKey: formKey ?? this.formKey,
      );





}
