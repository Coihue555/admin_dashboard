import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/services/local_storage.dart';

part 'login_event.dart';
part 'login_state.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<OnValidateEvent>(_onValidateEvent);
    on<OnCheckLoginDataEvent>(_onCheckLoginDataEvent);
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
      shp.token = 'werwerwer.werwerwerwe.werwerwer';

      token = shp.token;
    }
    if (token.isNotEmpty) {
      authStatus = AuthStatus.authenticated;
    } else {
      authStatus = AuthStatus.notAuthenticated;
    }

    NavigationService.replaceTo(Flurorouter.dashboardRoute);

    // await Future.delayed(Duration(seconds: 4));
    print(error);

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
    
      shp.token = 'werwerwer.werwerwerwe.werwerwer';

      
    

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




}
