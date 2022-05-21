import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_dashboard/bloc/blocs.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';

class CategoriesDTS extends DataTableSource{

  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDTS(this.categorias, this.context);

  @override
  DataRow getRow(int index) {

    final categoria = categorias[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(categoria.id)),
        DataCell(Text(categoria.nombre)),
        DataCell(Text(categoria.usuario.nombre)),
        DataCell(Row(
          children: [
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: (){
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: ( _ ) => CategoryModal(categoria: categoria),
                );
              }, 
            ),
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.red[400],),
              onPressed: (){
                final dialog = AlertDialog(
                  title: const Text('¿Esta seguro de borrarlo?'),
                  content: Text('¿Borrar definitivamente ${categoria.nombre}?'),
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
                        context.read<CategoriesBloc>().add(OnDeleteCategoryEvent(id: categoria.id));
                        Navigator.of(context).pop();
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
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;

}