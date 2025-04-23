import 'package:firstapp/src/widgets/system_widget_custom.dart';
import 'package:firstapp/src/widgets/utils/responsive.dart';
import 'package:flutter/material.dart';

class TitleName extends StatelessWidget {
  TitleName({super.key});
  Systemwidgetcustom systemwidgetcustom = Systemwidgetcustom();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.only(right: 8), // Border width
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(10),
          ),
          child: systemwidgetcustom.circleImageButton("assets/images/app-logo.png", 18, 50, () {}),
        ),
        SizedBox(
          width: Responsive.width * 0.5,
          child: Text(
            'Test User',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: Responsive.isTablet ? 28 : 22,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
