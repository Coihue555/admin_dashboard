import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDF1F2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Dashboard brah', style: TextStyle(fontSize: 50),),
            Expanded(
              child: Container(
                color:  Colors.white,
                child: child,
              )
            )
          ],
        ),
      ),
    );
  }
}