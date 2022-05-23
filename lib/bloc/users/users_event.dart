part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class OnGetUsersEvent extends UsersEvent{
  OnGetUsersEvent();
}

class OnSortEvent extends UsersEvent{
  OnSortEvent();
}
