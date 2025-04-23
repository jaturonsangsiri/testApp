part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetHomeData extends HomeEvent {
  final String? hospitalSelected;
  final String? departmentSelected;
  final List? devices;

  const GetHomeData({this.hospitalSelected,this.departmentSelected,this.devices});

  @override
  List<Object> get props => [hospitalSelected!, departmentSelected!,devices!];
}
