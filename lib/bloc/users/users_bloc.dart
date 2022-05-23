import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:admin_dashboard/api/cafeApi.dart';
import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/models/http/users_response.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersState()) {
    on<OnGetUsersEvent>(_onGetUsersEvent);
    on<OnGetUserByIdEvent>(_onGetUserByIdEvent);
    //on<OnSortEvent>(_onSortEvent);
  }

  Future<void> _onGetUsersEvent (OnGetUsersEvent event, Emitter emit) async {

    emit(state.copyWith(
      isLoading: true
    ));
    

    final resp = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final userResp = UsersResponse.fromMap(resp);

    emit(state.copyWith(
      isLoading: false,
      users: [... userResp.usuarios],
    ));
    
  }

  Future<void> _onGetUserByIdEvent (OnGetUserByIdEvent event, Emitter emit) async {

    emit(state.copyWith(
      isLoading: true
    ));
    


    emit(state.copyWith(
      isLoading: false,
    ));
    
  }



  // Future<void> _onSortEvent(OnSortEvent event, Emitter emit){
  //   bool ascending = true;

  //   void sort<T>(Comparable<T> Function(Usuario user) getField) {
  //     state.users.sort((a, b) {
  //       final aValue = getField(a);
  //       final bValue = getField(b);
        
  //       return ascending
  //        ? Comparable.compare(aValue, bValue)
  //        : Comparable.compare(bValue, aValue);

  //     },);
  //     ascending = !ascending;
  //   }

  //   emit(state.copyWith(

  //   ));

  // }
  //TODO no anda, video 170





}
