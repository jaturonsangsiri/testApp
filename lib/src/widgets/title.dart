import 'package:firstapp/src/widgets/systemWidgetCustom.dart';
import 'package:flutter/material.dart';

class TitleName extends StatelessWidget {
  TitleName({super.key});
  Systemwidgetcustom systemwidgetcustom = Systemwidgetcustom();

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > 700 ? true : false;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.only(right: 8), // Border width
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(10),
          ),
          child: systemwidgetcustom.circleImageButton("lib/src/images/app-logo.png", 18, 50, () {}),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            'Test User',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: isTablet ? 28 : 22,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
