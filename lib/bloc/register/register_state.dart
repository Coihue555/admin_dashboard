part of 'register_bloc.dart';

@immutable
class RegisterState {

  final bool isWorking;
  final String accion;
  final String error;
  final String campoError;
  final String nombre;
  final String email;
  final String password;

    RegisterState({
      this.isWorking = false,
      this.accion = '',
      this.error = '',
      this.campoError = '',
      this.nombre = '',
      this.email = '',
      this.password = '',
    });

    RegisterState copyWith({
      bool? isWorking,
      String? accion,
      String? error,
      String? campoError,
      String? nombre,
      String? email,
      String? password,
    }) => 
      RegisterState(
        isWorking: isWorking ?? this.isWorking,
        accion: accion ?? this.accion,
        error: error ?? this.error,
        campoError: campoError ?? this.campoError,
        nombre: nombre ?? this.nombre,
        email: email ?? this.email,
        password: password ?? this.password,
      );





}
