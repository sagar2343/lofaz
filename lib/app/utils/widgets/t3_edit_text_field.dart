import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../T4Colors.dart';

Padding t3EditTextField(var hintText,
    {isPassword = true, void Function(String)? onChanged}) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: TextFormField(
        onChanged: onChanged,
        style: primaryTextStyle(size: 18),
        obscureText: isPassword,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(26, 18, 4, 18),
          hintText: hintText,
          filled: true,
          fillColor: t3_edit_background,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: t3_edit_background, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: t3_edit_background, width: 0.0),
          ),
        ),
      ));
}

// editTextField() {}
