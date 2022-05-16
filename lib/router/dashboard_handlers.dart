import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_dashboard/ui/views/views.dart';
import 'package:admin_dashboard/bloc/blocs.dart';

class DashboardHandlers {
  
  static Handler dashboard = Handler(
      handlerFunc: (context, params){
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if(state.authStatus == AuthStatus.authenticated){
              return DashboardView();
            } else {
              return LoginView();
            }
          }
        );
      }
    );
}