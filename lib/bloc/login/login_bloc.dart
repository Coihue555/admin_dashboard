import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

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
        GlobalKey<FormState> formKey = GlobalKey<FormState>();

    
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
      formKey = event.formKey;
    }


    emit(state.copyWith(
        isWorking: false,
        error: error,
        campoError: campoError,
        accion: 'OnValidateEvent',
        email: email,
        password: password,
        formKey: formKey,
        ));
    }

    
  


}
