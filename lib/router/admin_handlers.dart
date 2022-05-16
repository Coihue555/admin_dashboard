import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_dashboard/bloc/login/login_bloc.dart';
import 'package:admin_dashboard/ui/views/views.dart';

class AdminHandlers {
  
  static Handler login = Handler(
      handlerFunc: (context, params){
        //context!.read<LoginBloc>().add(OnCheckLoginDataEvent());
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if(state.authStatus == AuthStatus.notAuthenticated){
              return LoginView();
            } else {
              return DashboardView();
            }
          }
        );
        
      }
    );

  static Handler register = Handler(
      handlerFunc: (context, params){
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if(state.authStatus == AuthStatus.notAuthenticated){
              return RegisterView();
            } else {
              return DashboardView();
            }
          }
        );
        
      }
    );
}