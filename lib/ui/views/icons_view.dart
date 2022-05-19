import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class IconsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Icons', style: CustomLabels.h1,),
          const SizedBox( height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: const [
              WhiteCard(
                title: 'ac_unit_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.ac_unit_outlined),
                )
              ),
              WhiteCard(
                title: 'access_alarm_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.access_alarm_outlined),
                )
              ),
              WhiteCard(
                title: 'bedtime',
                width: 170,
                child: Center(
                  child: Icon(Icons.bedtime),
                )
              ),
              WhiteCard(
                title: 'cell_tower',
                width: 170,
                child: Center(
                  child: Icon(Icons.cell_tower),
                )
              ),
              WhiteCard(
                title: 'dinner_dining_sharp',
                width: 170,
                child: Center(
                  child: Icon(Icons.dinner_dining_sharp),
                )
              ),
              WhiteCard(
                title: 'earbuds',
                width: 170,
                child: Center(
                  child: Icon(Icons.earbuds),
                )
              ),
              
            ],
          )
        ],
      ),
    );
  }
}