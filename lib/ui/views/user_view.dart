import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_dashboard/bloc/blocs.dart';
import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class UserView extends StatefulWidget {
  final String uid;

  const UserView({required this.uid});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {

  @override
  void initState() {
    
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    List<Usuario> userBloc;
    
    return BlocConsumer<UsersBloc, UsersState>(
      listener: (context, state){
        
      },
      builder: (context, state){
        if (state.accion == 'OnGetUserByIdEvent' )
        {
          userBloc = state.users;
        } else {
          userBloc = [];
        }
        print('averrr');
        print(userBloc.first.nombre);
        return Container(
          padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              Text('User View', style: CustomLabels.h1,),
              const SizedBox( height: 10),

              if( userBloc.isEmpty)
              WhiteCard(
                  child: Container(
                    alignment: Alignment.center,
                    height: 300,
                    child: const CircularProgressIndicator(),
                  )
                ),
              _UserViewBody(userBody: userBloc.first,),
              
            ],
          ),
        );
      }
    );
  }
}

class _UserViewBody extends StatelessWidget {
  final Usuario userBody;

  const _UserViewBody({required this.userBody});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(250)
        },
        children: [
          TableRow(
            children: [
              _AvatarContainer(),

              //Formulario de actualizacion 
              _UserViewForm( userViewForm: userBody,)
            ]
          )
        ],
      ),
    );
  }
}

class _UserViewForm extends StatefulWidget {
  final Usuario userViewForm;

  const _UserViewForm({required this.userViewForm});

  @override
  State<_UserViewForm> createState() => _UserViewFormState();
}

class _UserViewFormState extends State<_UserViewForm> {

  
  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<UsersBloc, UsersState>(
      listener: (context, state){

      },
      builder: (context, state){
        
        return WhiteCard(
          title: 'Informacion general',
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  initialValue: widget.userViewForm.nombre,
                  decoration: CustomInputs.formInputDecoration(
                    hint: 'Nombre del usuario',
                    label: 'Nombre',
                    icon: Icons.supervised_user_circle_outlined
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  initialValue: widget.userViewForm.correo,
                  decoration: CustomInputs.formInputDecoration(
                    hint: 'Correo del usuario',
                    label: 'Correo',
                    icon: Icons.markunread_mailbox_outlined
                  ),
                ),
                const SizedBox(height: 20,),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 110),
                  child: ElevatedButton(
                    onPressed:(){},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.save_outlined, size: 20),
                        Text('  Guardar')
                      ]
                    ),
                  ),
                )

              ],
            ),
          )
        );
      },
    );
  }
}

class _AvatarContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      width: 250,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Profile', style: CustomLabels.h2,),
            const SizedBox( height: 20,),
            SizedBox(
              width: 150,
              height: 160,
              child: Stack(
                children: [
                  const ClipOval(
                    child: Image(
                      image: AssetImage('no-image.jpg')
                    )
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 5) 
                      ),
                      child: FloatingActionButton(
                        backgroundColor: Colors.indigo,
                        elevation: 0,
                        onPressed: () {  },
                        child: const Icon(Icons.camera_alt_outlined, size: 20,),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox( height: 20,),
            const Text(
              'Nombre de usuario',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )
    );
  }
}