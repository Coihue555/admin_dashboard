part of 'users_bloc.dart';

@immutable
class UsersState {

  final bool isLoading;
  final List<Usuario> users;
  final String accion;
  final String error;
  final bool isWorking;

  UsersState({
    this.isLoading = true,
    this.accion = '',
    this.error = '',
    this.isWorking = false,
    List<Usuario>? users,
  }) : users = users ?? [];

  UsersState copyWith({
    final bool? isLoading,
    final List<Usuario>? users,
    final bool? isWorking,
    final String? accion,
    final String? error,
  }) => 
        UsersState(
          isWorking: isWorking ?? this.isWorking,       
          accion: accion ?? this.accion,
          error: error ?? this.error,
          isLoading: isLoading ?? this.isLoading,
          users: users ?? this.users,
        );

  
}

