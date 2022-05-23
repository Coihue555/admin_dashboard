import 'package:admin_dashboard/ui/buttons/links_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      height: (size.width > 1000) ? size.height*0.07 : null,
      child: Wrap(
        alignment: WrapAlignment.center,
        children:  [
          LinkText( texto: 'About', onPressed: () {}),
          const LinkText( texto: 'Help Center'),
          const LinkText( texto: 'Terms of Service'),
          const LinkText( texto: 'Carrers'),
          const LinkText( texto: 'Advertisement'),
          const LinkText( texto: 'Privacy Policy'),
          const LinkText( texto: 'Blog'),
          const LinkText( texto: 'Status'),
          const LinkText( texto: 'Brand Resources'),
          const LinkText( texto: 'Marketing'),
        ],
      )
    );
  }
}