


import 'package:admin_dashboard/ui/views/views.dart';
import 'package:fluro/fluro.dart';

class NoPageFoundHandlers {
  
  static Handler noPageFound = Handler(
      handlerFunc: (context, params){
        return NoPageFoundView();
      }
    );
}