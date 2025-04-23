part of 'home_bloc.dart';

class HomeState extends Equatable {
  final String hospitalSelected;
  final String departmentSelected;
  // ข้อมูลประกอบด้วยชื่ออุปกรณ์ เลขอุปกรณ์ สถานะการเชื่อมต่อ
  final List devices;
  final List<Hospital> hospitals;

  // ข้อมูลรายการแผนกของโรงพยาบาลที่เลือก
  final List<DropdownMenuEntry<String>> departmentEntries;
  const HomeState({this.hospitalSelected = 'โรงพยาบาล 1',this.departmentSelected = 'แผนกฉุกเฉิน', this.devices = const [], this.hospitals = const [], this.departmentEntries = const []});

  HomeState copyWith({String? hospitalSelected, String? departmentSelected, List? devices}) {
    return HomeState(hospitalSelected: hospitalSelected ?? 'โรงพยาบาล 1', departmentSelected: departmentSelected ?? 'แผนกฉุกเฉิน', devices: devices ?? []);
  }
  
  @override
  List<Object> get props => [hospitalSelected,departmentSelected,devices];
}
