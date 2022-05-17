import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_dashboard/bloc/login/login_bloc.dart';
import 'package:admin_dashboard/ui/views/views.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: (context, params) {
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (previous, current) => !current.isWorking,
      listener: (context, state) {
      },
      builder: (context, state) {
        if(state.authStatus == AuthStatus.notAuthenticated){
          return LoginView();
        } else {
          return DashboardView();
        }
        
      },
    );
  });

  static Handler register = Handler(handlerFunc: (context, params) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if(state.authStatus == AuthStatus.notAuthenticated){
          return RegisterView();
        } else {
          return DashboardView();
        }
        
      },
    );
  });
}