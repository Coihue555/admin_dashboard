import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class DashboardView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Dashboard View', style: CustomLabels.h1,),
          const SizedBox( height: 10),
          const WhiteCard(
            title: 'Sales Statistics',
            child: Text('Hello friend')
          )
        ],
      ),
    );
  }
}