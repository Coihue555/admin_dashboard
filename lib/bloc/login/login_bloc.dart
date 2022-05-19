import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:admin_dashboard/api/cafeApi.dart';
import 'package:admin_dashboard/models/http/auth_response.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/services.dart';

part 'login_event.dart';
part 'login_state.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
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
    String token = '';
    AuthStatus authStatus = AuthStatus.authenticated;

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

    if (error.isEmpty) {
      final data = {
        'correo': email,
        'password': password,
      };
      CafeApi.post('/usuarios', data).then(
          (json) {
            print(json);
            final authResponse = AuthResponse.fromMap(json);
            shp.token = authResponse.token;
          }
        ).catchError( (e) => print('error en: $e') );
    }

      token = shp.token;
    


    if (token.isNotEmpty) {
      authStatus = AuthStatus.authenticated;
    } else {
      authStatus = AuthStatus.notAuthenticated;
    }

    NavigationService.replaceTo(Flurorouter.dashboardRoute);


    emit(state.copyWith(
      isWorking: false,
      error: error,
      campoError: campoError,
      accion: 'OnValidateEvent',
      email: email,
      password: password,
      isLogged: isLogged,
      token: token,
      authStatus: authStatus,
    ));
  }

  Future<void> _onCheckLoginDataEvent(OnCheckLoginDataEvent event, Emitter emit) async {
    final shp = LocalStorage();
    
      shp.token = '';

    emit(state.copyWith(
      isWorking: false,
      error: state.error,
      campoError: state.campoError,
      accion: 'OnCheckLoginDataEvent',
      email: state.email,
      password: state.password,
      isLogged: state.isLogged,
      token: shp.token,
      authStatus: AuthStatus.authenticated,
    ));
  }


  Future<void> _onLogoutEvent(OnLogoutEvent event, Emitter emit) async {

    final shp = LocalStorage();
    shp.token = '';
    
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
