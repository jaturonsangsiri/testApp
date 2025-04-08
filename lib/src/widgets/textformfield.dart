import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String title;
  final String errTxt;
  final TextEditingController controller;
  const MyTextFormField({required this.title, required this.errTxt, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: title,
        //errorText: errTxt,
        border: OutlineInputBorder()
      ),
      controller: controller,
    );
  }
}