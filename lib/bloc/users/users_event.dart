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

class OnSortEvent extends UsersEvent{
  OnSortEvent();
}
