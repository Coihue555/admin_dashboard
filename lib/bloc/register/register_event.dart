part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class OnValidateRegisterEvent extends RegisterEvent {
  final String nombre;
  final String email;
  final String password;

  OnValidateRegisterEvent({required this.nombre, required this.email, required this.password, });
}
