

import 'package:admin_dashboard/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesDTS extends DataTableSource{

  final List<Categoria> categorias;

  CategoriesDTS(this.categorias);

  @override
  DataRow getRow(int index) {

    final categoria = this.categorias[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(categoria.id)),
        DataCell(Text(categoria.nombre)),
        DataCell(Text(categoria.usuario.nombre)),
        DataCell(Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit_outlined),
              onPressed: (){
                print('Editando: $categoria');
              }, 
            ),
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.red[400],),
              onPressed: (){
                print('Borrando: $categoria');
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