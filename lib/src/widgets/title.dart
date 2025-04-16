import 'package:flutter/material.dart';

class TitleName extends StatelessWidget {
  const TitleName({super.key});

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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox.fromSize(
              size: Size.fromRadius(isTablet ? 28 : 18),
              child: Image.asset(
                'lib/src/images/app-logo.png',
                fit: BoxFit.cover,
                height: 50,
                scale: 0.7,
              ),
            ),
          ),
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
