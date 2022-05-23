import 'package:admin_dashboard/bloc/blocs.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/models/usuario.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersDataSource extends DataTableSource{


  final List<Usuario> users;
  final BuildContext context;

  UsersDataSource(this.users, this.context);


  @override
  DataRow getRow(int index) {

  final user = users[index];
  const image = Image(image: AssetImage('no-image.jpg'), width: 35, height: 35,);


    return DataRow.byIndex(
      index: index,
      cells: [
        const DataCell(ClipOval(child: image,)),
        DataCell(Text(user.nombre)),
        DataCell(Text(user.correo)),
        DataCell(Text(user.uid)),
        DataCell(Row(
          children: [
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: (){
                context.read<UsersBloc>().add(OnGetUserByIdEvent(uid: user.uid));
                NavigationService.replaceTo('/dashboard/users/${user.uid}');
                //context.read<SidemenuBloc>().add(OnCurrentPage(currentPage: Flurorouter.userRoute));
                //TODO: cuando recargo la pagina no queda guardado el id de usuario/la pagina
              },
            ),
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.red[400],),
              onPressed: (){
                final dialog = AlertDialog(
                  title: const Text('¿Esta seguro de borrarlo?'),
                  actions: [
                    TextButton(
                      child: const Text('No'),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Si, borrar'),
                      onPressed: () async {
                      },
                    ),
                  ],
                );

                showDialog(
                  context: context,
                  builder: ( _ ) => dialog
                );
              }, 
            ),
          ],
        )),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;

}