part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class OnValidateEvent extends LoginEvent {
  final String email;
  final String password;
  final GlobalKey<FormState> formKey;

  OnValidateEvent({required this.email, required this.password, required this.formKey});
}