import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/ui/views/views.dart';

class AdminHandlers {
  
  static Handler login = Handler(
      handlerFunc: (context, params){
        return LoginView();
      }
    );

  static Handler register = Handler(
      handlerFunc: (context, params){
        return RegisterView();
      }
    );
}