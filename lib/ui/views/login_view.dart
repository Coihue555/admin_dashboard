import 'package:admin_dashboard/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_dashboard/bloc/login/login_bloc.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/links_text.dart';

class LoginView extends StatefulWidget {

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
    String txtEmail = '';
    String txtPassword = '';

  @override
  Widget build(BuildContext context) {

    return MultiBlocListener(

      listeners: [
        BlocListener<LoginBloc, LoginState>(
          listenWhen: (previous, current) => !current.isWorking,
          listener: (context, state) {
            
            if(state.error.isEmpty && state.accion=='OnValidateEvent'){
              NavigationService.replaceTo(Flurorouter.dashboardRoute);
            }
          },)
      ],
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(top: 100),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                  child: Column(
                    children: [
                      //Email
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: buildInputDecoration(
                            hint: 'Ingrese su email',
                            label: 'Email',
                            icon: Icons.email),
                        onChanged: (value){
                          txtEmail = value;
                        },
                      ),
                      const SizedBox(height: 10),
    
                      //Password
                      TextFormField(
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: buildInputDecoration(
                            hint: '********',
                            label: 'Password',
                            icon: Icons.lock),
                        onChanged: (value){
                          txtPassword = value;                        
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomOutlinedButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(OnValidateEvent(email: txtEmail, password: txtPassword,));
                        },
                        text: 'Ingresar',
                      ),
    
                      const SizedBox(height: 20),
                      LinkText(
                        texto: 'Nueva cuenta',
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Flurorouter.registerRoute);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  InputDecoration buildInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(
        icon,
        color: Colors.grey,
      ),
      labelStyle: const TextStyle(color: Colors.grey),
      hintStyle: const TextStyle(color: Colors.grey),
    );
  }



}
