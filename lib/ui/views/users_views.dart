import 'package:admin_dashboard/datatables/users_datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_dashboard/bloc/blocs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class UsersView extends StatefulWidget {

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {

  @override
  void initState() {
    context.read<UsersBloc>().add(OnGetUsersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10),
      child: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {

          final usersDataSource = UsersDataSource(state.users, context);

          return ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              Text('Users View', style: CustomLabels.h1,),
              const SizedBox( height: 10),
              PaginatedDataTable(
                columns: [
                  const DataColumn(label: Text('Avatar')),
                  DataColumn(label: const Text('Nombre'), onSort: (colIndex, _){
                  context.read<UsersBloc>().add(OnSortEvent());
                  }),
                  DataColumn(label: const Text('Email'), onSort: (colIndex, _){
                    
                  }),
                  const DataColumn(label: Text('UID')),
                  const DataColumn(label: Text('Acciones')),
                ],
                source: usersDataSource,
                //onPageChanged: (){},
              )
            ],
          );
        },
      )
    );
  }
}