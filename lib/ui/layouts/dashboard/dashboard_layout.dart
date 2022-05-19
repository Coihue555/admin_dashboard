import 'package:admin_dashboard/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/shared/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> with SingleTickerProviderStateMixin{

  static late AnimationController menuController;

  static Animation<double> movement = Tween<double>(begin: -200, end: 0)
    .animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static Animation<double> opacity = Tween<double>(begin: 0, end: 1)
    .animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  @override
  void initState() {
    menuController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return BlocConsumer<SidemenuBloc, SidemenuState>(
      listener: (context, state){

      },
      builder: (context, state){

        (state.isOpen) ? menuController.forward() : menuController.reverse();

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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            child: widget.child,
                          )
                        )
                      ],
                    )
                  )
                ],
              ),
              

              if(size.width < 700)
                AnimatedBuilder(
                  animation: menuController,
                  builder: (context, _) => Stack(
                    children: [
                      if(state.isOpen)
                        AnimatedOpacity(
                          opacity: opacity.value,
                          duration: const Duration(milliseconds: 200),
                          child: GestureDetector(
                            child: Container(color: Colors.black26,),
                            onTap: (){
                              menuController.reverse();
                              context.read<SidemenuBloc>().add(OnCloseMenu());
                            },
                          ),
                        ),

                      Transform.translate(
                          offset: Offset(movement.value, 0),
                          child: Sidebar(),
                        )
                      
                    ],
                  )
                )
              

            ],
          )
        );
      }, 
    );
  }
}