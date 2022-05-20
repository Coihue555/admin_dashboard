import 'package:admin_dashboard/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              Text('Dashboard View', style: CustomLabels.h1,),
              const SizedBox( height: 10),
              WhiteCard(
                title: 'Hello ${LocalStorage().userName}',
                child: Text(state.email)
              )
            ],
          ),
        );
      }
    );
  }
}