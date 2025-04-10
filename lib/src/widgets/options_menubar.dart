import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/widgets/icons_style.dart';
import 'package:flutter/material.dart';

// เมนตัวเลือกด้านบนของแอป
// แสดงเมนูต่างๆ ฟันเฟืองการต้งค่า ปุ่มแจ้งเตือน
class OptionsMenubar extends StatefulWidget {
  const OptionsMenubar({super.key, required this.selectedItem});
  final CustomPopupMenuItem selectedItem;

  @override
  State<OptionsMenubar> createState() => _OptionsMenubarState();
}

class _OptionsMenubarState extends State<OptionsMenubar> {
  late CustomPopupMenuItem _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleIcon(
          icon: Icon(Icons.notifications, color: Colors.white, size: 20),
          colorbg: primaryColor,
          padding: 2,
          function: () {},
        ),
        PopupMenuButton<CustomPopupMenuItem>(
          initialValue: _selectedItem,
          color: Colors.white,
          child: Icon(Icons.settings, color: Colors.white, size: 20),
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
                  icon: Icon(Icons.person, color: threeColor.withOpacity(0.8)),
                  onTap: () {
                    // ไปหน้าโปรไฟล์
                  },
                ),
              ),
              CustomCustomPopupMenuItem(
                value: CustomPopupMenuItem(
                  title: 'ออกจากระบบ',
                  icon: Icon(Icons.logout, color: threeColor.withOpacity(0.8)),
                  onTap: () {
                    // ปิดทั้ง popup menu และออกจากระบบไปหน้าเข้าสู่ระบบ
                    Navigator.pop(context);
                    Navigator.pop(context);
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
      title: Text(widget.value.title, style: TextStyle(color: threeColor),),
      onTap: widget.value.onTap,
    );
  }
}
