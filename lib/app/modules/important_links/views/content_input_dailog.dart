import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/m_button.dart';

class ContentInputDialog extends StatelessWidget {
  final Function(String) onSubmit;
  final String title;
  final String initialValue;
  final RxString content;

  ContentInputDialog({
    Key? key,
    required this.onSubmit,
    required this.title,
    required this.initialValue,
  }) : content = RxString(initialValue), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: TextFormField(
        initialValue: content.value,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9- ]")),
        ],
        onChanged: (value) {
          content.value = value;
        },
        decoration: const InputDecoration(
          hintText: "Enter your privacy policy",
          border: InputBorder.none,
        ),
        maxLines: 8,
      ),
      actions: [
        MButton(
          onPressed: () {
            Get.back();
          },
          label: "Cancel",
        ),
        Obx(() {
          return MButton(
            backgroundColor: Colors.green.shade500,
            onPressed: content.value.trim() == initialValue.trim()
                ? null
                : () {
              onSubmit(content.value);
              Get.back();
            },
            label: "Submit",
          );
        }),
      ],
    );
  }
}
