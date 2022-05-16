import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<OnValidateEvent>(_onValidateEvent);
  }

  Future<void> _onValidateEvent(OnValidateEvent event, Emitter emit) async {
    emit(state.copyWith(
        isWorking: true,
        error: '',
        campoError: '',
        accion: 'OnValidateEvent'));
        String error = '';
        String campoError = '';
        String email= '';
        String password = '';
        bool isLogged = false;
        String token = 'werwerwer.werwerwerwe.werwerwer';

    
    if(event.email.isEmpty){
      error = 'Ingrese un email';
      campoError = 'Email';
    } else {
      email = event.email;
    }

    if(error.isEmpty){
      if(event.password.isEmpty || event.password.length < 8){
        error = 'La contraseña debe tener 8 caracteres como minimo';
        campoError = 'Password';
      } else {
        password = event.password;
      }
    }


    if(error.isEmpty){
      LocalStorage.prefs.setString('token', token);
    }


    print(error);




    emit(state.copyWith(
        isWorking: false,
        error: error,
        campoError: campoError,
        accion: 'OnValidateEvent',
        email: email,
        password: password,
        isLogged: isLogged,
        ));
    }

    
  


}
