import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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

    emit(state.copyWith(
        isWorking: false,
        error: error,
        campoError: campoError,
        accion: 'OnValidateEvent',
        email: email,
        password: password,
        ));
    }
}
