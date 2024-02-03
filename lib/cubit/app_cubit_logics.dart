import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_flutter/cubit/app_cubit_states.dart';
import 'package:travel_app_flutter/cubit/app_cubits.dart';
import 'package:travel_app_flutter/pages/detail_page.dart';
import 'package:travel_app_flutter/pages/home_page.dart';
import 'package:travel_app_flutter/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          } else if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is DetailState) {
            return DetailPage();
          } else if (state is LoadedState) {
            return HomePage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
