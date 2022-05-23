// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_dashboard/bloc/blocs.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/shared/widgets.dart';
import 'package:admin_dashboard/services/services.dart';

class Sidebar extends StatefulWidget {

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SidemenuBloc, SidemenuState>(
      listenWhen: (previous, current) => !current.isWorking,
      listener: (context, state){
      },
      builder: (context, state){
        return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Logo(),
          const SizedBox(height: 30,),
          const TextSeparator(text: 'main'),
          CustomMenuItem(
            isActive: LocalStorage().currentPage == Flurorouter.dashboardRoute,
            text: 'Dashboard', icon: Icons.compass_calibration_outlined, onPressed: () {
            context.read<SidemenuBloc>().add(OnCurrentPage(currentPage: Flurorouter.dashboardRoute));
          },),
          CustomMenuItem(text: 'Orders', icon: Icons.ramen_dining, onPressed: () {
            context.read<SidemenuBloc>().add(OnCloseMenu());
          },),
          CustomMenuItem(text: 'Analytics', icon: Icons.show_chart_outlined, onPressed: () {
            context.read<SidemenuBloc>().add(OnCloseMenu());
          },),
          CustomMenuItem(
            isActive: LocalStorage().currentPage == Flurorouter.categoriesRoute,
            text: 'Categories', icon: Icons.layers_outlined, onPressed: () {
            context.read<SidemenuBloc>().add(OnCurrentPage(currentPage: Flurorouter.categoriesRoute));
          },),
          CustomMenuItem(text: 'Products', icon: Icons.dashboard_outlined, onPressed: () {
            context.read<SidemenuBloc>().add(OnCloseMenu());
          },),
          CustomMenuItem(text: 'Discount', icon: Icons.attach_money_outlined, onPressed: () {
            context.read<SidemenuBloc>().add(OnCloseMenu());
          },),
          CustomMenuItem(
            isActive: LocalStorage().currentPage == Flurorouter.usersRoute,
            text: 'Users', icon: Icons.people_alt_outlined, onPressed: () {
            context.read<SidemenuBloc>().add(OnCurrentPage(currentPage: Flurorouter.usersRoute));
          },),
          const SizedBox(height: 30,),
          const TextSeparator(text: 'UI Elements'),
          CustomMenuItem(
            isActive: LocalStorage().currentPage == Flurorouter.iconsRoute,
            text: 'Icons', icon: Icons.list_alt_outlined, onPressed: () {
            context.read<SidemenuBloc>().add(OnCurrentPage(currentPage: Flurorouter.iconsRoute));
          },),
          CustomMenuItem(text: 'Marketing', icon: Icons.mark_email_read_outlined, onPressed: () {
            context.read<SidemenuBloc>().add(OnCloseMenu());
          },),
          CustomMenuItem(text: 'Campaign', icon: Icons.note_add_outlined, onPressed: () {
            context.read<SidemenuBloc>().add(OnCloseMenu());
          },),
          CustomMenuItem(
            isActive: state.currentPage == Flurorouter.blankRoute,
            text: 'Blank', icon: Icons.post_add_outlined, onPressed: () {
            context.read<SidemenuBloc>().add(OnCurrentPage(currentPage: Flurorouter.blankRoute));
          },),

          const SizedBox(height: 50,),
          const TextSeparator(text: 'Exit'),
          CustomMenuItem(
            text: 'Logout', icon: Icons.list_alt_outlined, onPressed: () {
            context.read<SidemenuBloc>().add(OnCloseMenu());
            context.read<LoginBloc>().add(OnLogoutEvent());
          },),

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