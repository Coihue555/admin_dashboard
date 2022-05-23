part of 'users_bloc.dart';

@immutable
class UsersState {

  final bool isLoading;
  final List<Usuario> users;

  UsersState({
    this.isLoading = true,
    List<Usuario>? users,
  }) : users = users ?? [];

  UsersState copyWith({
    final bool? isLoading,
    final List<Usuario>? users,
  }) => 
        UsersState(
          isLoading: isLoading ?? this.isLoading,
          users: users ?? this.users,
        );

  
}

