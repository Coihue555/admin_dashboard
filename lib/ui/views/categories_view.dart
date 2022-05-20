import 'package:admin_dashboard/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_dashboard/bloc/blocs.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/datatables/categories_datasources.dart';

class CategoriesView extends StatefulWidget {

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {

  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    context.read<CategoriesBloc>().add(OnGetCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final List<Categoria> categorias = BlocProvider.of<CategoriesBloc>(context).state.categorias;
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Categories', style: CustomLabels.h1,),
          const SizedBox( height: 10),
          PaginatedDataTable(
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Categoria')),
                DataColumn(label: Text('Creado por')),
                DataColumn(label: Text('Acciones')),
              ],
              source: CategoriesDTS( categorias, context),
              header: const FittedBox(
                fit: BoxFit.contain,
                child: Text('Esta es la lista de todas las categorias disponibles', maxLines: 2,),
              ),
              onRowsPerPageChanged: (value){
                setState(() {
                  _rowsPerPage = value ?? 10;
                });
              },
              rowsPerPage: _rowsPerPage,
              actions: [
                CustomIconButton(
                  onPressed: (){}, 
                  text: 'Crear', 
                  icon: Icons.add_outlined
                )
              ],
            )
        ],
      ),
    );
  }
}