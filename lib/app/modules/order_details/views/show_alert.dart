import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lofaz/app/utils/m_button.dart';

class CustomAlert extends StatelessWidget {
  final String message;
  final String buttonText;
  final String negativeButtonText;
  final Color buttonColor;
  final IconData icon;
  const CustomAlert(
      {super.key,
      required this.message,
      required this.buttonColor,
      required this.buttonText,
      this.negativeButtonText = "CANCEL",
      this.icon = Bootstrap.cart3});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        shape: Theme.of(context).cardTheme.shape,
        surfaceTintColor: buttonColor,
        title: Icon(
          icon,
          color: buttonColor,
          size: 40,
        ),
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: MButton(
                  backgroundColor: Colors.red,
                  forgroundColor: Colors.white,
                  onPressed: () {
                    Get.back(
                      result: false,
                    );
                  },
                  label: negativeButtonText,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: MButton(
                  backgroundColor: buttonColor,
                  forgroundColor: Colors.white,
                  onPressed: () {
                    Get.back(
                      result: true,
                    );
                  },
                  label: buttonText,
                ),
              ),
            ],
          ),
          // ElevatedButton(onPressed: () {}, child: const Text("CANCEL"))
        ]);
  }
}
