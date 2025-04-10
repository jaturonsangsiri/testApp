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
          child: Stack(
            alignment: Alignment.center,
            children: [
              icon!,
              Positioned(
                right: -4,
                top: -4,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '1', // Replace with the actual notification count
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
