import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_dashboard/ui/views/views.dart';
import 'package:admin_dashboard/bloc/blocs.dart';

class DashboardHandlers {
  
  static Handler dashboard = Handler(
      handlerFunc: (context, params){
        return BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if(state.authStatus == AuthStatus.authenticated){
              return DashboardView();
            } else {
              return LoginView();
            }
            
          },
        );
      }
    );

  static Handler icons = Handler(
      handlerFunc: (context, params){
        return BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if(state.authStatus == AuthStatus.authenticated){
              return IconsView();
            } else {
              return LoginView();
            }
            
          },
        );
      }
    );

    static Handler blank = Handler(
      handlerFunc: (context, params){
        return BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if(state.authStatus == AuthStatus.authenticated){
              return BlankView();
            } else {
              return LoginView();
            }
            
          },
        );
      }
    );

    static Handler categories = Handler(
      handlerFunc: (context, params){
        return BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if(state.authStatus == AuthStatus.authenticated){
              return CategoriesView();
            } else {
              return LoginView();
            }
            
          },
        );
      }
    );

    static Handler users = Handler(
      handlerFunc: (context, params){
        return BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if(state.authStatus == AuthStatus.authenticated){
              return UsersView();
            } else {
              return LoginView();
            }
            
          },
        );
      }
    );

}