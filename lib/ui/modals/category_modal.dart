import 'dart:ui';

import 'package:admin_dashboard/bloc/blocs.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryModal extends StatefulWidget {

  final Categoria? categoria;

  const CategoryModal({
    required this.categoria
  });
  
  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String nombre = '';
  String? id;

  @override
  void initState() {
    super.initState();
    id = widget.categoria?.id;
    nombre = widget.categoria?.nombre ?? '';
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 500,
      width: 300,
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.categoria?.nombre ?? 'Nueva categoria', style: CustomLabels.h1.copyWith(color: Colors.white)),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white,),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
          Divider(color: Colors.white.withOpacity(.3),),
          const SizedBox(height: 20,),
          TextFormField(
            initialValue: widget.categoria?.nombre ?? '',
            onChanged: ( value ) => nombre = value,
            decoration: CustomInputs.loginInputDecoration(
              hint: 'Nombre de la categoria',
              label: 'Categoria',
              icon: Icons.new_releases_outlined
            ),
            style: const TextStyle(color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              onPressed: () async {
                print(nombre);
                if(id == null){
                  context.read<CategoriesBloc>().add(OnNewCategoryEvent(name: nombre));
                  NotificationsService.showSnackbar('$nombre creado!');
                } else{
                  context.read<CategoriesBloc>().add(OnUpdateCategoryEvent(name: nombre, id: id!));
                  NotificationsService.showSnackbar('$nombre actualizado!');
                }
                Navigator.of(context).pop();
              },
              text: 'Guardar',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
    color: Color(0xff0F2041),
    boxShadow: [
      BoxShadow(
        color: Colors.black26
      )
    ]
  );
}