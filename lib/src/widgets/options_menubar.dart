import 'package:firstapp/src/contants/contants.dart';
import 'package:firstapp/src/pages/notification_page.dart';
import 'package:firstapp/src/pages/profile_page.dart';
import 'package:firstapp/src/widgets/icons_style.dart';
import 'package:firstapp/src/widgets/system_widget_custom.dart';
import 'package:firstapp/src/widgets/utils/responsive.dart';
import 'package:firstapp/src/widgets/webview_widget.dart';
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
  Systemwidgetcustom systemwidgetcustom = Systemwidgetcustom();

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
          icon: Icon(Icons.notifications, color: Colors.white, size: Responsive.isTablet? 35 : 30),
          colorbg: primaryColor,
          padding: Responsive.isTablet? 15 : 10,
          function: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage(),)),
        ),
        const SizedBox(width: 10,),
        PopupMenuButton<CustomPopupMenuItem>(
          initialValue: _selectedItem,
          color: Colors.white,
          child: Icon(Icons.settings, color: Colors.white, size: Responsive.isTablet? 35 : 30),
          onSelected: (CustomPopupMenuItem item) {
            setState(() {
              _selectedItem = item;
            });
          },
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<CustomPopupMenuItem>>[
              CustomCustomPopupMenuItem(
                value: CustomPopupMenuItem(
                  title: 'บัญชีผู้ใช้',
                  icon: Icon(Icons.person, size: 20, color: primaryColor.withOpacity(0.8)),
                  // ไปหน้าโปรไฟล์
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),)),
                ),
              ),
              CustomCustomPopupMenuItem(
                value: CustomPopupMenuItem( 
                  title: 'นโยบายความเป็นส่วนตัว',
                  icon: Icon(Icons.privacy_tip, size: 20, color: primaryColor.withOpacity(0.8)),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WebviewWidget(url: 'https://siamatic.co.th/privacy-policy', title: 'นโยบายความเป็นส่วนตัว'),)),
                ),
              ),
              CustomCustomPopupMenuItem(
                value: CustomPopupMenuItem(
                  title: 'ข้อกำหนดและเงื่อนไข',
                  icon: Icon(Icons.info, size: 20, color: primaryColor.withOpacity(0.8)),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WebviewWidget(url: 'https://siamatic.co.th/terms-conditions', title: 'ข้อกำหนดและเงื่อนไข'),)),
                ),
              ),
              CustomCustomPopupMenuItem(
                value: CustomPopupMenuItem(
                  title: 'ออกจากระบบ',
                  icon: Icon(Icons.logout, size: 20, color: primaryColor.withOpacity(0.8)),
                  onTap: () {
                    systemwidgetcustom.showDialogConfirm(context, 'ออกจากระบบ', 'ท่านต้องการออกจากระบบหรือไม่?', () {
                      // ปิดทั้ง popup menu และออกจากระบบไปหน้าเข้าสู่ระบบ
                      Navigator.pop(context);
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
    return TextButton.icon(onPressed: widget.value.onTap, style: TextButton.styleFrom(alignment: Alignment.centerLeft,padding: const EdgeInsets.symmetric(horizontal: 16.0)), icon: widget.value.icon, label: Text(widget.value.title, style: TextStyle(color: primaryColor, fontSize: 16),),);
  }
}
