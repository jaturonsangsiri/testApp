import 'package:firstapp/src/bloc/layout_event.dart';
import 'package:firstapp/src/bloc/layout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutBloc extends Bloc<LayoutEvent, LayoutState> {
  LayoutBloc() : super(MobileLayoutState()) {
    on<CheckLayoutEvent>((event, emit) {
      if(event.screenWidth > 600) {
        emit(TabletLayoutState());
      } else {
        emit(MobileLayoutState());
      }
    });
  }
}