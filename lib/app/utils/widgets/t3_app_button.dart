import 'package:flutter/material.dart';

import '../AppColors.dart';
import '../T4Colors.dart';

class T3AppButton extends StatelessWidget {
  final String textContent;
  final VoidCallback onPressed;

  const T3AppButton(
      {super.key, required this.textContent, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          padding: const EdgeInsets.all(0.0),
          elevation: 4,
          textStyle: const TextStyle(color: white)),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[t4_colorPrimary, t4_colorPrimaryDark]),
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              textContent,
              style: const TextStyle(fontSize: 18, color: white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
