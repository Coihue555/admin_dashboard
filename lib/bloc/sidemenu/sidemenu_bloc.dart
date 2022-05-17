import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sidemenu_event.dart';
part 'sidemenu_state.dart';

class SidemenuBloc extends Bloc<SidemenuEvent, SidemenuState> {
  SidemenuBloc() : super(const SidemenuState()) {
    on<OnOpenMenu>(_onOpenMenu);
    on<OnCloseMenu>(_onCloseMenu);
  }

    Future<void> _onOpenMenu(OnOpenMenu event, Emitter emit) async {

      emit(state.copyWith(
          error: '',
          isWorking: false,
          accion: 'OnOpenMenu',
          isOpen: true
      ));
    
  }


  Future<void> _onCloseMenu(OnCloseMenu event, Emitter emit) async {

    emit(state.copyWith(
        error: '',
        isWorking: false,
        accion: 'OnCloseMenu',
        isOpen: false
    ));
  }

}
