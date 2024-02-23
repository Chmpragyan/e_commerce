import 'package:flutter/material.dart';

InputDecoration inputDecoration({
  required String textHint,
  Icon? prefixIcon,
  Icon? suffixIcon,
}) {
  return InputDecoration(
    hintText: textHint,
    hintStyle: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    prefixIconColor: Colors.grey,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  );
}
