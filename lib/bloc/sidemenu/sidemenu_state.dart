part of 'sidemenu_bloc.dart';

@immutable
class SidemenuState {
  final String error;
  final String accion;
  final bool isWorking;
  final bool isOpen;
  final String currentPage;

  const SidemenuState({
    this.error = '',
    this.accion = '',
    this.isWorking = false,
    this.isOpen = false,
    this.currentPage = '',
  });

  SidemenuState copyWith({
    final String? error,
    final String? accion,
    final bool? isWorking,
    final bool? isOpen,
    final String? currentPage
  }) => 
      SidemenuState(
        error: error ?? this.error,
        accion: accion ?? this.accion,
        isWorking: isWorking ?? this.isWorking,
        isOpen: isOpen ?? this.isOpen,
        currentPage: currentPage ?? this.currentPage,
      );





}
