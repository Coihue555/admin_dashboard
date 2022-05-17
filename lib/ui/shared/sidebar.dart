import 'package:admin_dashboard/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/shared/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sidebar extends StatefulWidget {

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> with SingleTickerProviderStateMixin{
  
  static late AnimationController menuController;

  static Animation<double> movement = Tween<double>(begin: -200, end: 0)
    .animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static Animation<double> opacity = Tween<double>(begin: 0, end: 1)
    .animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

    

  @override
  void initState() {
    menuController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SidemenuBloc, SidemenuState>(
      listenWhen: (previous, current) => !current.isWorking,
      listener: (context, state){},
      builder: (context, state){
        return Container(
          width: 200,
          height: double.infinity,
          decoration: buildBoxDecoration(),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              Logo(),
              const SizedBox(height: 50,),
              const TextSeparator(text: 'main'),
              CustomMenuItem(text: 'Dashboard', icon: Icons.compass_calibration_outlined, onPressed: () => print('Dashboard'),),
              CustomMenuItem(text: 'Orders', icon: Icons.ramen_dining, onPressed: () => print('Ramen'),),
              CustomMenuItem(text: 'Analytics', icon: Icons.show_chart_outlined, onPressed: () => print('Analytics'),),
              CustomMenuItem(text: 'Categories', icon: Icons.layers_outlined, onPressed: () => print('Categories'),),
              CustomMenuItem(text: 'Products', icon: Icons.dashboard_outlined, onPressed: () => print('Products'),),
              CustomMenuItem(text: 'Discount', icon: Icons.attach_money_outlined, onPressed: () => print('Discount'),),
              CustomMenuItem(text: 'Customers', icon: Icons.people_alt_outlined, onPressed: () => print('Customers'),),
              const SizedBox(height: 50,),
              const TextSeparator(text: 'UI Elements'),
              CustomMenuItem(text: 'Icons', icon: Icons.list_alt_outlined, onPressed: () => print('Analytics'),),
              CustomMenuItem(text: 'Marketing', icon: Icons.mark_email_read_outlined, onPressed: () => print('Categories'),),
              CustomMenuItem(text: 'Campaign', icon: Icons.note_add_outlined, onPressed: () => print('Products'),),
              CustomMenuItem(text: 'Black', icon: Icons.post_add_outlined, onPressed: () => print('Products'),),
              CustomMenuItem(text: 'Logout', icon: Icons.exit_to_app_outlined, onPressed: () => print('Discount'),),

            ],
          ),
        );
      }, 
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color(0xff092044),
        Color(0xff092042)
      ]
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10
      )
    ]
  );
}