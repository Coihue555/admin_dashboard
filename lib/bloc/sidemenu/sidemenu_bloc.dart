import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:admin_dashboard/services/services.dart';

part 'sidemenu_event.dart';
part 'sidemenu_state.dart';

class SidemenuBloc extends Bloc<SidemenuEvent, SidemenuState> {
  SidemenuBloc() : super(const SidemenuState()) {
    on<OnOpenMenu>(_onOpenMenu);
    on<OnCloseMenu>(_onCloseMenu);
    on<OnCurrentPage>(_onCurrentPage);
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

  Future<void> _onCurrentPage(OnCurrentPage event, Emitter emit) async {

    emit(state.copyWith(
        error: '',
        isWorking: true,
        accion: 'OnCurrentPage',
        currentPage: LocalStorage().currentPage
    ));

    final shp = LocalStorage();
    (event.userID.isEmpty)
    ? shp.currentPage = (event.currentPage).replaceAll(':uid', '')
    : shp.currentPage = (event.currentPage).replaceAll(':uid', '') + event.userID;
    

    
    NavigationService.replaceTo(shp.currentPage);
    add(OnCloseMenu());

    emit(state.copyWith(
        error: '',
        isWorking: false,
        accion: 'OnCurrentPage',
        currentPage: shp.currentPage
    ));
  }

}
