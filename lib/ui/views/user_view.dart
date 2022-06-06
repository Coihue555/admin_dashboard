import 'package:admin_dashboard/router/router.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_dashboard/bloc/blocs.dart';
import 'package:admin_dashboard/models/usuario.dart';
import 'package:email_validator/email_validator.dart';
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
  Usuario? user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersBloc, UsersState>(
        listenWhen: (previous, current) => !current.isWorking,
        listener: (context, state) {
          if (state.accion == 'OnGetUserByIdEvent') {
            setState(() {
              user = state.users.first;
            });
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                Text(
                  'User View',
                  style: CustomLabels.h1,
                ),
                const SizedBox(height: 10),
                if (user?.nombre == null)
                  WhiteCard(
                      child: Container(
                    alignment: Alignment.center,
                    height: 300,
                    child: const CircularProgressIndicator(),
                  )),
                _UserViewBody(),
              ],
            ),
          );
        });
  }
}

class _UserViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
        columnWidths: const {0: FixedColumnWidth(250)},
        children: [
          TableRow(children: [
            _AvatarContainer(),

            //Formulario de actualizacion
            _UserViewForm()
          ])
        ],
      );
  }
}

class _UserViewForm extends StatefulWidget {
  @override
  State<_UserViewForm> createState() => _UserViewFormState();
}

class _UserViewFormState extends State<_UserViewForm> {
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerCorreo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersBloc, UsersState>(
      listenWhen: (previous, current) => !current.isWorking,
      listener: (context, state) {
        if (state.accion == 'OnGetUserByIdEvent') {
          setState(() {
            controllerNombre.text = state.users.first.nombre;
            controllerCorreo.text = state.users.first.correo;
          });
        }

        if(state.accion == 'OnValidateFormEvent' && state.error.isEmpty){
          context.read<UsersBloc>().add(OnUpdateUserEvent());
          setState(() { });
        }
        if(state.accion == 'OnUpdateUserEvent' && state.error.isEmpty){
          context.read<SidemenuBloc>().add(OnCurrentPage('', currentPage: Flurorouter.usersRoute));
        }
      },
      builder: (context, state) {
        return WhiteCard(
            title: 'Informacion general',
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  TextFormField(
                    controller: controllerNombre,
                    decoration: CustomInputs.formInputDecoration(
                        hint: 'Nombre del usuario',
                        label: 'Nombre',
                        icon: Icons.supervised_user_circle_outlined),
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Ingrese un nombre';}
                      if (value.length < 5){
                        return 'El nombre debe ser mayor a 4 letras';}
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        controllerNombre.text == value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controllerCorreo,
                    decoration: CustomInputs.formInputDecoration(
                        hint: 'Correo del usuario',
                        label: 'Correo',
                        icon: Icons.markunread_mailbox_outlined),
                    validator: (value) {
                      if (!EmailValidator.validate(value ?? '')){
                        return 'Email no valido';}
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        controllerCorreo.text == value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 120),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<UsersBloc>().add(OnValidateFormEvent(
                            campoNombre: controllerNombre.text,
                            campoEmail: controllerCorreo.text,));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.indigo),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.save_outlined,
                            size: 20,
                          ),
                          Text('  Guardar')
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}

class _AvatarContainer extends StatefulWidget {
  @override
  State<_AvatarContainer> createState() => _AvatarContainerState();
}

class _AvatarContainerState extends State<_AvatarContainer> {
TextEditingController nameUsuario = TextEditingController();

  @override
  Widget build(BuildContext context) {

  
    return BlocConsumer<UsersBloc, UsersState>(
      listenWhen: (previous, current) => !current.isWorking,
      listener: (context, state) {
        if (state.accion == 'OnGetUserByIdEvent') {
          setState(() {
            nameUsuario.text = state.users.first.nombre;
          });
        }
         

        
      },
      builder: (context, state) {
        return WhiteCard(
            width: 250,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Profile',
                    style: CustomLabels.h2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150,
                    height: 160,
                    child: Stack(
                      children: [
                         ClipOval(
                            child: (state.users.first.img == null) ? const Image(image: AssetImage('no-image.jpg')) : Image.network(state.users.first.img!)
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(color: Colors.white, width: 5)),
                            child: FloatingActionButton(
                              backgroundColor: Colors.indigo,
                              elevation: 0,
                              onPressed: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles();

                                if (result != null) {
                                  //PlatformFile file = result.files.first;
                                  //print(file.name);
                                  //print(file.bytes);
                                  //print(file.size);
                                  //print(file.extension);
                                  print('subiendo');
                                  context.read<UsersBloc>().add(OnCargarImagenEvent(bytes: result.files.first.bytes!));
                                } else {
                                  // User canceled the picker
                                  print('no hay imagen');
                                }
                              },
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                size: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    (state.users.first.nombre == '') ? nameUsuario.text = 'Nombre' : nameUsuario.text = state.users.first.nombre,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
