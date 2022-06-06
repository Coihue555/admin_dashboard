import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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
    on<OnValidateFormEvent>(_onValidateFormEvent);
    on<OnUpdateUserEvent>(_onUpdateUserEvent);
    on<OnCargarImagenEvent>(_onCargarImagenEvent);
    //on<OnSortEvent>(_onSortEvent);
  }

  Future<void> _onGetUsersEvent(OnGetUsersEvent event, Emitter emit) async {

    emit(state.copyWith(
      isLoading: true,
      isWorking: true
    ));
    

    final resp = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final userResp = UsersResponse.fromMap(resp);

    emit(state.copyWith(
      isLoading: false,
      isWorking: false,
      users: [... userResp.usuarios],
    ));
    
  }

  Future<void> _onGetUserByIdEvent(OnGetUserByIdEvent event, Emitter emit) async {

    emit(state.copyWith(
        isLoading: true,
        isWorking: true,
        accion: 'OnGetUserByIdEvent'
      ));
    
    final List<Usuario> finalUsers = [];
    final String uid = event.uid;

      final resp = await CafeApi.httpGet('/usuarios/$uid');
      final user = Usuario.fromMap(resp);
      print(user.nombre);

      finalUsers.add(user);
      
      emit(state.copyWith(
        isLoading: false,
        users: finalUsers,
        isWorking: false,
        accion: 'OnGetUserByIdEvent'
      ));
  }

  Future<void> _onValidateFormEvent(OnValidateFormEvent event, Emitter emit) async {
    emit(state.copyWith(
      isWorking: true,
      accion: 'OnValidateFormEvent',
      error: '',
    ));

    String error;
    String campoNombre;
    String campoEmail;
    List<Usuario> users = [];
    Usuario user = Usuario(
      rol: state.users.first.rol,
      estado: state.users.first.estado,
      google: state.users.first.google,
      nombre: state.users.first.nombre,
      correo: state.users.first.correo,
      uid: state.users.first.uid);

    
    if(event.campoEmail.length > 10){
      user.correo = event.campoEmail;
      error = '';
    } else {
      user.correo = state.users.first.correo;
      error = 'Error al editar el email';
    }

    if(event.campoNombre.length > 4){
      user.nombre = event.campoNombre;
      error = '';
    } else {
      user.nombre = state.users.first.nombre;
      error = 'Error al editar el nombre';
    }

      
    if(error.isEmpty){
      users.add(user);
    }
    

    
    emit(state.copyWith(
      isWorking: false,
      accion: 'OnValidateFormEvent',
      error: error,
      users: users,
    ));
  }

  Future<void> _onUpdateUserEvent(OnUpdateUserEvent event, Emitter emit) async {

    emit(state.copyWith(
        isLoading: true,
        isWorking: true,
        accion: 'OnUpdateUserEvent'
      ));
    
    final String uid = state.users.first.uid;

      final resp = await CafeApi.httpGet('/usuarios/$uid');
      final user = Usuario.fromMap(resp);
      final data = {
        'nombre': state.users.first.nombre,
        'correo': state.users.first.correo,
      };

      try {
        final resp = await CafeApi.put('/usuarios/${user.uid}', data);
        print(resp);
        
      } on DioError catch (e) {
        print('error en updateUser: $e');
      }
      
      emit(state.copyWith(
        isLoading: false,
        isWorking: false,
        accion: 'OnUpdateUserEvent'
      ));
  }

  Future<void> _onCargarImagenEvent(OnCargarImagenEvent event, Emitter emit) async {

    emit(state.copyWith(
        isWorking: true,
        accion: 'OnCargarImagenEvent'
      ));
      List<Usuario> users = state.users;

      

    try {
      final resp = await CafeApi.uploadFile('/uploads/usuarios/${users.first.uid}', event.bytes);
      users.first = Usuario.fromMap(resp);

    } catch (e) {
      print(e);
      throw 'Error subiendo foto';
    }

    emit(state.copyWith(
        isWorking: false,
        accion: 'OnCargarImagenEvent',
        users: users,
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
