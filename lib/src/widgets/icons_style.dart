import 'package:firstapp/src/contants/contants.dart';
import 'package:flutter/material.dart';

// ไอคอนแบบมีวงกลม
// ใช้เป็นไอคอนมีวงลมด้านหลัง มีสีของไอคอน สีวงกลมหลังไอคอน ไอคอนอะไร ขนาดไอคอน
class CircleIcon extends StatelessWidget {
  final Color? colorbg;
  final Widget? icon;
  final Function()? function;
  final double padding;

  const CircleIcon({
    required this.icon,
    required this.colorbg,
    required this.function,
    required this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ElevatedButton(
          onPressed: function,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(CircleBorder()),
            padding: MaterialStateProperty.all(EdgeInsets.all(padding)),
            backgroundColor: MaterialStateProperty.all(
              colorbg,
            ), // <-- Button color
            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.pressed)) {
                return threeColor; // <-- Splash color
              }
            }),
          ),
          child: icon!
        ),
      ],
    );
  }
}

// ไอคอนแบบธรรมดา มีไอคอนและตัวหนังสือ
class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final double size;
  final double fontSize;
  const IconText({super.key, required this.icon, required this.text, required this.color, required this.size, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color,size: size,),
        Text(text, style: TextStyle(color: color, fontSize: fontSize),),
        const SizedBox(width: 10,)
      ],
    );
  }
}

// ไอคอนมีกรอบวงกลมรอบไอคอนแต่ไม่มีเลขเหมือนตัวแจ้งเตือน หรือแจ้งเตือนจำนวนข้อความ
class CircleIconNoNumber extends StatelessWidget {
  final Color? colorbg;
  final Widget? icon;
  final Function()? function;
  final double padding;

  const CircleIconNoNumber({
    required this.icon,
    required this.colorbg,
    required this.function,
    required this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(CircleBorder()),
        padding: MaterialStateProperty.all(EdgeInsets.all(padding)),
        backgroundColor: MaterialStateProperty.all(
          colorbg,
        ), // <-- Button color
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return secColor; // <-- Splash color
          }
        }),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          icon!,
        ],
      ),
    );
  }
}