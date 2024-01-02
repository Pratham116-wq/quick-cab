import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomTextInputField(String labelText, String hintText, Icon inserticon,
    TextInputType keyboardType, bool obscureText, String? Function(String?)? validator) {
  return TextFormField(
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      labelText: labelText,
      prefixIcon: inserticon,
      prefixIconColor: Colors.orange,
    ),
    keyboardType: keyboardType,
    cursorColor: Colors.blue,
    obscureText: obscureText,
    validator: validator,
  );
}
