part of 'sidemenu_bloc.dart';

@immutable
class SidemenuState {
  final String error;
  final String accion;
  final bool isWorking;
  final bool isOpen;

  const SidemenuState({
    this.error = '',
    this.accion = '',
    this.isWorking = false,
    this.isOpen = false,
  });

  SidemenuState copyWith({
    final String? error,
    final String? accion,
    final bool? isWorking,
    final bool? isOpen,
  }) => 
      SidemenuState(
        error: error ?? this.error,
        accion: accion ?? this.accion,
        isWorking: isWorking ?? this.isWorking,
        isOpen: isOpen ?? this.isOpen,
      );





}
