import 'package:firstapp/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<GetHomeData>((event, emit) {
      emit(state.copyWith(
        hospitalSelected: event.hospitalSelected ?? state.hospitalSelected,
        departmentSelected: event.departmentSelected ?? state.departmentSelected,
        devices: event.devices ?? state.devices
      ));
    });
  }
}
