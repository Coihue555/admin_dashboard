part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class OnValidateEvent extends LoginEvent {
  final String email;
  final String password;

  OnValidateEvent({required this.email, required this.password});
}

class OnCheckLoginDataEvent extends LoginEvent{
  OnCheckLoginDataEvent();
}

class OnLogoutEvent extends LoginEvent{
  OnLogoutEvent();
}