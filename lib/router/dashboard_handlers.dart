import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_dashboard/ui/views/views.dart';
import 'package:admin_dashboard/bloc/blocs.dart';

class DashboardHandlers {
  
  static Handler dashboard = Handler(
      handlerFunc: (context, params){
        return BlocConsumer<LoginBloc, LoginState>(
          listenWhen: (previous, current) => !current.isWorking,
          listener: (context, state) {
          },
          builder: (context, state) {
            if(state.authStatus == AuthStatus.authenticated){
              //NavigationService.replaceTo(Flurorouter.dashboardRoute); //era para actualizar la url pero se actualiza sola
              return DashboardView();
            } else {
              return LoginView();
            }
            
          },
        );
      }
    );
}