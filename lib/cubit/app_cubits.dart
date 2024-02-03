import 'package:bloc/bloc.dart';
import 'package:travel_app_flutter/cubit/app_cubit_states.dart';
import 'package:travel_app_flutter/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final plases;
  void getData() async {
    try {
      emit(LoadingState());
      plases = await data.getInfo();
      emit(LoadedState(places: plases));
    } catch (e) {}
  }
}
