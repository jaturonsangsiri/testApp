import 'package:firstapp/src/bloc/home/home_bloc.dart';
import 'package:firstapp/src/constants/contants.dart';
import 'package:firstapp/src/widgets/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectDropdown extends StatelessWidget {
  const SelectDropdown({super.key});

  // // ดึงข้อมูลอุปกรณ์โรงพยาบาลและแผนก
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Center(
          child: state.hospitals.isEmpty? SizedBox(height: 80, child: Text('ไม่มีข้อมูล',style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: fourColor),)) : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              DropdownMenuTheme(
                data: DropdownMenuThemeData(menuStyle: MenuStyle(backgroundColor: WidgetStateProperty.all(Colors.white),)),
                child: DropdownMenu<String>(
                  initialSelection: 'state.hospitals.first.name', 
                  width: Responsive.isTablet? Responsive.width * 0.4 : Responsive.width * 0.8,
                  dropdownMenuEntries: state.hospitals.map((hospital) {
                    return DropdownMenuEntry<String>(
                      value: 'hospital.name!',
                      label: 'hospital.name!',
                    ); 
                  }).toList(),
                  onSelected: (value) {
                    context.read<HomeBloc>().add(GetHomeData(hospitalSelected: value));
                    //getHosAndDevice();
                  },
                  label: Text('โรงพยาบาล', style: TextStyle(fontSize: Responsive.isTablet? 20 : 16, fontWeight: FontWeight.w700),),
                ),
              ),
              const SizedBox(height: 10,),
              DropdownMenuTheme(
                data: DropdownMenuThemeData(menuStyle: MenuStyle(backgroundColor: WidgetStateProperty.all(Colors.white),)),
                child: DropdownMenu<String>(
                  initialSelection: 'state.hospitals.first.name',
                  width: Responsive.isTablet? Responsive.width * 0.4 : Responsive.width * 0.8,
                  dropdownMenuEntries: state.hospitals.map((depart) {
                    return DropdownMenuEntry<String>(
                      value: 'depart.name!',
                      label: 'depart.name!',
                    ); 
                  }).toList(),
                  onSelected: (value) {
                    context.read<HomeBloc>().add(GetHomeData(departmentSelected: value));
                    //getHosAndDevice();
                  },
                  label: Text('แผนก', style: TextStyle(fontSize: Responsive.isTablet? 20 : 16, fontWeight: FontWeight.w700),),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}