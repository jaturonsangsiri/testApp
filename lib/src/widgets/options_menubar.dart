import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/widgets/icons_style.dart';
import 'package:firstapp/src/widgets/systemWidgetCustom.dart';
import 'package:flutter/material.dart';

// เมนตัวเลือกด้านบนของแอป
// แสดงเมนูต่างๆ ฟันเฟืองการต้งค่า ปุ่มแจ้งเตือน
class OptionsMenubar extends StatefulWidget {
  const OptionsMenubar({super.key, this.selectedItem});
  final CustomPopupMenuItem? selectedItem;

  @override
  State<OptionsMenubar> createState() => _OptionsMenubarState();
}

class _OptionsMenubarState extends State<OptionsMenubar> {
  late CustomPopupMenuItem? _selectedItem;
  // เช็คว่าเป็นแท็บเล็ตหรือไม่
  bool isTablet = false;
  Systemwidgetcustom systemwidgetcustom = Systemwidgetcustom();

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    width > 600? isTablet = true : isTablet = false;
    return Row(
      children: [
        CircleIcon(
          icon: Icon(Icons.notifications, color: Colors.white, size: isTablet? 25 : 20),
          colorbg: primaryColor,
          padding: isTablet? 4 : 2,
          function: () {},
        ),
        const SizedBox(width: 20,),
        PopupMenuButton<CustomPopupMenuItem>(
          initialValue: _selectedItem,
          color: Colors.white,
          child: Icon(Icons.settings, color: Colors.white, size: isTablet? 25 : 20),
          onSelected: (CustomPopupMenuItem item) {
            setState(() {
              _selectedItem = item;
            });
          },
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<CustomPopupMenuItem>>[
              CustomCustomPopupMenuItem(
                value: CustomPopupMenuItem(
                  title: 'โปรไฟล์',
                  icon: Icon(Icons.person, color: primaryColor.withOpacity(0.8)),
                  onTap: () {
                    // ไปหน้าโปรไฟล์
                  },
                ),
              ),
              CustomCustomPopupMenuItem(
                value: CustomPopupMenuItem(
                  title: 'ออกจากระบบ',
                  icon: Icon(Icons.logout, color: primaryColor.withOpacity(0.8)),
                  onTap: () {
                    systemwidgetcustom.showDialogConfirm(context, 'ออกจากระบบ', 'ท่านต้องการออกจากระบบหรือไม่?', () {
                      // ปิดทั้ง popup menu และออกจากระบบไปหน้าเข้าสู่ระบบ
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }, primaryColor, const Color.fromRGBO(255, 99, 71, 1));
                  },
                ),
              ),
            ];
          },
        ),
      ],
    );
  }
}

// คลาส CustomPopupMenuItem สำหรับสร้างเมนูแบบป็อปอัพ
class CustomPopupMenuItem {
  final String title;
  final Widget icon;
  final Function() onTap;

  CustomPopupMenuItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}

// คลาส CustomCustomPopupMenuItem สำหรับแปลง CustomPopupMenuItem ให้เป็น PopupMenuEntry
class CustomCustomPopupMenuItem extends PopupMenuEntry<CustomPopupMenuItem> {
  final CustomPopupMenuItem value;

  CustomCustomPopupMenuItem({required this.value});

  @override
  double get height => kMinInteractiveDimension;

  @override
  bool represents(CustomPopupMenuItem? value) => this.value == value;

  @override
  State createState() => _CustomCustomPopupMenuItemState();
}

class _CustomCustomPopupMenuItemState extends State<CustomCustomPopupMenuItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.value.icon,
      title: Text(widget.value.title, style: TextStyle(color: primaryColor),),
      onTap: widget.value.onTap,
    );
  }
}
