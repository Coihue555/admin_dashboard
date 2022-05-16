import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_dashboard/bloc/register/register_bloc.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/links_text.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends StatefulWidget {
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
    String txtNombre = '';
    String txtEmail = '';
    String txtPassword = '';

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<RegisterBloc, RegisterState>(
          listenWhen: (previous, current) => !current.isWorking,
          listener: (context, state) {
            if (state.error.isNotEmpty) {
              final snackBar = SnackBar(
                duration: const Duration(milliseconds: 2000),
                content: Text(state.error),
                backgroundColor: Colors.red,
                action: SnackBarAction(
                  label: 'Ok',
                  onPressed: () {},
                ),
              );
              //ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state.error.isEmpty && !state.isWorking){
              Navigator.pushNamed(context, Flurorouter.loginRoute);
            }
          },
        )
      ],
      child: BlocBuilder<RegisterBloc, RegisterState>(
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
                      //Nombre
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Ingrese su nombre',
                            label: 'Nombre',
                            icon: Icons.person),
                        onChanged: (value){
                          txtNombre = value;
                        },
                      ),
                      const SizedBox(height: 10),
                      //Email
                      TextFormField(
                        //validator: ,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
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
                        //validator: ,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                            hint: '********',
                            label: 'Password',
                            icon: Icons.lock),
                        onChanged: (value){
                          txtPassword = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomOutlinedButton(
                        text: 'Crear cuenta',
                        onPressed: () {
                          context.read<RegisterBloc>().add(OnValidateRegisterEvent(nombre: txtNombre, email: txtEmail, password: txtPassword,));
                        },
                      ),

                      const SizedBox(height: 20),
                      LinkText(
                        texto: 'Ya tienes una cuenta?',
                        onPressed: () {
                          Navigator.pushNamed(context, Flurorouter.loginRoute);
                        },
                      )
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
}
