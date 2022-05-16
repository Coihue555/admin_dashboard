import 'package:admin_dashboard/ui/layouts/auth/widgets/backgroud_twitter.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {

  final Widget child;

  const AuthLayout({
    Key? key,
    required this.child
  }) : super (key: key);


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scrollbar(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
      
            (size.width > 980)
              ? _DesktopBody(child: child)
              : _MobileBody( child: child),
      
            //LinksBar
            LinksBar()
          ],
        ),
      )
    );
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;

  const _MobileBody({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          CustomTitle(),
          SizedBox(
            width: double.infinity,
            height: 420,
            child: child,
          ),
          SizedBox(
            width: double.infinity,
            height: 400,
            child: BackgroundTwitter(),
          )
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {

  final Widget child;

  const _DesktopBody({
      Key? key,
    required this.child
  }) : super (key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height*.93,
      child: Row(
        children: [
          //tw background
          Expanded(child: BackgroundTwitter()),

          //View Container
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(height: 20,),
                CustomTitle(),
                const SizedBox(height: 50,),
                Expanded(child: child)
              ],
            ),
          )


        ],
      ),
    );
  }
}