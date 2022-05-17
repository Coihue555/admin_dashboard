import 'package:admin_dashboard/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/shared/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {

    context.read<SidemenuBloc>().add(OnOpenMenu());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [
              if(size.width >= 700)
                Sidebar(),
                
              Expanded(
                child: Column(
                  children: [
                    NavBar(),
                    Expanded(child: child)
                  ],
                )
              )
            ],
          ),
          

          if(size.width < 700)
          Sidebar()

        ],
      )
    );
  }
}