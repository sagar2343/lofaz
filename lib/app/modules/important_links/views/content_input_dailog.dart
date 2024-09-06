import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

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
    // Create a controller for the QuillHtmlEditor
    // final htmlEditorController = QuillHtmlEditorController();
    final QuillEditorController htmlEditorController = QuillEditorController();

    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        height: 250, // Adjust height as needed
        child: Column(
          children: [
            // Toolbar for rich text editing
            ToolBar(
              toolBarColor: Colors.cyan.shade50,
              activeIconColor: Colors.green,
              padding: const EdgeInsets.all(8),
              iconSize: 20,
              controller: htmlEditorController,
              toolBarConfig: const [
                ToolBarStyle.bold,
                ToolBarStyle.italic,
                ToolBarStyle.underline,
                ToolBarStyle.headerOne,
                ToolBarStyle.headerTwo,
                ToolBarStyle.undo,
                ToolBarStyle.redo,
                ToolBarStyle.image,
                ToolBarStyle.blockQuote,
              ],
            ),
            Expanded(
              child: QuillHtmlEditor(
                text: content.value,
                hintText: 'Write something here',
                controller: htmlEditorController,
                isEnabled: true,
                minHeight: 300,
                hintTextStyle: const TextStyle(
                  color: Colors.grey,
                ),
                onTextChanged: (text) {
                  content.value = text;
                },
              ),
            ),
          ],
        ),
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
