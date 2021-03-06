import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:admin_dashboard/api/cafeApi.dart';
import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/models/http/auth_response.dart';
import 'package:admin_dashboard/services/services.dart';

part 'login_event.dart';
part 'login_state.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<OnValidateEvent>(_onValidateEvent);
    on<OnCheckLoginDataEvent>(_onCheckLoginDataEvent);
    on<OnLogoutEvent>(_onLogoutEvent);
  }

  Future<void> _onValidateEvent(OnValidateEvent event, Emitter emit) async {
    emit(state.copyWith(
      isWorking: true,
      error: '',
      campoError: '',
      authStatus: AuthStatus.checking,
      accion: 'OnValidateEvent',
    ));

    final shp = LocalStorage();
    shp.token = '';
    String error = '';
    String campoError = '';
    String email = '';
    String password = '';
    bool isLogged = false;
    AuthStatus authStatus;
    

    if (event.email.isEmpty) {
      error = 'Ingrese un email';
      campoError = 'Email';
    } else {
      email = event.email;
    }

    if (error.isEmpty) {
      if (event.password.isEmpty || event.password.length < 8) {
        error = 'La contraseña debe tener 8 caracteres como minimo';
        campoError = 'Password';
      } else {
        password = event.password;
      }
    }

    final data = {
      'correo': email,
      'password': password,
    };


    final resp = await CafeApi.post('/auth/login', data);
    final authResponse = AuthResponse.fromMap(resp);
    shp.token = authResponse.token;
    shp.userName = authResponse.usuario.nombre;
    email = authResponse.usuario.correo;
    (shp.token.isNotEmpty ) ? authStatus = AuthStatus.authenticated : authStatus = AuthStatus.notAuthenticated;
    
    CafeApi.configureDio();

    
    emit(state.copyWith(
      isWorking: false,
      error: error,
      campoError: campoError,
      accion: 'OnValidateEvent',
      email: email,
      password: password,
      isLogged: isLogged,
      token: shp.token,
      authStatus: authStatus,
    ));
  }

  Future<void> _onCheckLoginDataEvent(OnCheckLoginDataEvent event, Emitter emit) async {
    
    AuthStatus authStatus = state.authStatus;
    Usuario user;
    String email;
    String currentPage = LocalStorage().currentPage;

    try {
      final resp = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(resp);
      user = authResponse.usuario;
      email = authResponse.usuario.correo;
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('currentPage', currentPage);

    } catch (e) {
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      email = '';
    }
  
    CafeApi.configureDio();
    

    emit(state.copyWith(
      isWorking: false,
      accion: 'OnCheckLoginDataEvent',
      authStatus: authStatus,
      email: email,
    ));
  }


  Future<void> _onLogoutEvent(OnLogoutEvent event, Emitter emit) async {

    
    LocalStorage.prefs.remove('token');
    LocalStorage.prefs.remove('userName');
    LocalStorage.prefs.remove('currentPage');
    
    
    emit(state.copyWith(
      isWorking: false,
      error: '',
      campoError: 'Logout',
      accion: 'OnLogoutEvent',
      email: '',
      password: '',
      isLogged: false,
      token: '',
      authStatus: AuthStatus.notAuthenticated,
    ));
  }




}
