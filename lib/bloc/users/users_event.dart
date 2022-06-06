part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class OnGetUsersEvent extends UsersEvent{
  OnGetUsersEvent();
}

class OnGetUserByIdEvent extends UsersEvent{
  final String uid;
  OnGetUserByIdEvent({required this.uid});
}

class OnValidateFormEvent extends UsersEvent{
  final String campoNombre;
  final String campoEmail;
  OnValidateFormEvent({required this.campoNombre, required this.campoEmail});
}

class OnUpdateUserEvent extends UsersEvent{
  OnUpdateUserEvent();
}

class OnCargarImagenEvent extends UsersEvent{
  final Uint8List bytes;
  OnCargarImagenEvent({ required this.bytes});
}

class OnSortEvent extends UsersEvent{
  OnSortEvent();
}
