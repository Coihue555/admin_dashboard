import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class BlankView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Blank View braahh', style: CustomLabels.h1,),
          const SizedBox( height: 10),
          const WhiteCard(
            title: 'Blank page',
            child: Text('Hello friend')
          )
        ],
      ),
    );
  }
}