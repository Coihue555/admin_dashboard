import 'package:flutter/material.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/links_text.dart';

class RegisterView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
                  //validator: ,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese su nombre',
                    label: 'Nombre',
                    icon: Icons.person),
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
                ),
                const SizedBox(height: 20),
                CustomOutlinedButton(
                  onPressed: (){},
                  text: 'Crear cuenta',
                ),

                const SizedBox(height: 20),
                LinkText(
                  texto: 'Ya tienes una cuenta?',
                  onPressed: (){
                    Navigator.pushNamed(context, Flurorouter.loginRoute);
                  },
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  
}