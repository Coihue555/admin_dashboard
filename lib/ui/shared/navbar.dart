import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/shared/widgets.dart';

class NavBar extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          if(size.width<=700)
            IconButton(icon: const Icon(Icons.menu_outlined), onPressed: (){},),
          
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