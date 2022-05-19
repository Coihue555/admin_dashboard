import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:admin_dashboard/bloc/blocs.dart';
import 'package:admin_dashboard/api/cafeApi.dart';
import 'package:admin_dashboard/models/http/auth_response.dart';
import 'package:admin_dashboard/services/services.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<OnValidateRegisterEvent>(_onValidateRegisterEvent);
  }

    Future<void> _onValidateRegisterEvent(OnValidateRegisterEvent event, Emitter emit) async {
    emit(state.copyWith(
        isWorking: true,
        error: '',
        campoError: '',
        accion: 'OnValidateEvent'));
        String error = '';
        String campoError = '';
        String nombre = '';
        String email= '';
        String password = '';
        Usuario user;
        final shp = LocalStorage();

        

    if(event.nombre.isEmpty || event.nombre.length < 6){
      error = 'El nombre debe tener 6 caracteres minimo';
      campoError = 'Nombre';
    } else {
      nombre = event.nombre;
    }
    if(error.isEmpty){
      if(event.email.isEmpty){
        error = 'Ingrese un email';
        campoError = 'Email';
      } else {
        email = event.email;
      }
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
      final data = {
        'nombre': nombre,
        'correo': email,
        'password': password,
      };

      CafeApi.post('/usuarios', data).then(
          (json) {
            print(json);
            final authResponse = AuthResponse.fromMap(json);
            user = authResponse.usuario;
            shp.token = authResponse.token;
          }
        ).catchError( (e) {
            print('error en: $e');
            NotificationsService.showSnackbarError('Usuario / Password no valido');
          } );
    }



    emit(state.copyWith(
        isWorking: false,
        error: error,
        campoError: campoError,
        accion: 'OnValidateEvent',
        nombre: nombre,
        email: email,
        password: password,
        ));
    }
}
