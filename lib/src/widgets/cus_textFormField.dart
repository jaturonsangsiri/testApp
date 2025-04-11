import 'package:firstapp/src/contants/contants.dart';
import 'package:flutter/material.dart';

// ---------- คลาส Widget TextFormField ----------
class CusTextformfield {
  Widget normalTextFormField({
    required String hintText,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required String valueSave,
    required FocusNode focus,
  }) {
    return TextFormField(
      focusNode: focus,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: sixColor.withOpacity(0.5),
          ),
        ),
      ),
      onSaved: (value) {
        valueSave = value!;
      },
    );
  }
}