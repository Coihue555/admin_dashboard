import 'package:admin_dashboard/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/shared/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBar extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return BlocConsumer<SidemenuBloc, SidemenuState>(
        listener: (context, state){},
        builder: (context, state){
          return Container(
            width: double.infinity,
            height: 50,
            decoration: buildBoxDecoration(),
            child: Row(
              children: [
                if(size.width<=700)
                  IconButton(
                    icon: const Icon(Icons.menu_outlined),
                    onPressed: () {
                      context.read<SidemenuBloc>().add(OnOpenMenu());
                      print('menu is open!');

                    }
                  ),

                const SizedBox(width: 5,),

                if(size.width > 390)
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 250),
                    child: SearchText(),
                  ),

                const Spacer(),
                NotificationsIndicator(),
                const SizedBox(width: 10,),
                NavBarAvatar(),
                const SizedBox(width: 20,),



              ],
            ),
          );
        },
      );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 5
      )
    ]
  );
}