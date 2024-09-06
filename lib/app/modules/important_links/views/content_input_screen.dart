import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

import '../../../utils/m_button.dart';

class ContentInputScreen extends StatelessWidget {
  final Function(String) onSubmit;
  final String title;
  final String initialValue;
  final RxString content;

  ContentInputScreen({
    Key? key,
    required this.onSubmit,
    required this.title,
    required this.initialValue,
  }) : content = RxString(initialValue), super(key: key);

  @override
  Widget build(BuildContext context) {
    final QuillEditorController htmlEditorController = QuillEditorController();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                textStyle: const TextStyle(
                  fontSize: 16, // Adjust the font size as needed
                ),
                onTextChanged: (text) {
                  content.value = text;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // MButton(
                //   onPressed: () {
                //     Get.back();
                //   },
                //   label: "Cancel",
                // ),
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: Get.width * 0.4,
                    height: Get.height * 0.05,
                    child: const Center(child: Text('Cancel',style: TextStyle(color: Colors.white))),
                  ),
                ),
                Obx((){
                  return GestureDetector(
                    onTap: content.value.trim() == initialValue.trim()
                        ? null
                        : () {
                      onSubmit(content.value);
                      Get.back();
                      Future.delayed(const Duration(seconds: 2), () {
                        _requestReview();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: Get.width * 0.4,
                      height: Get.height * 0.05,
                      child: const Center(child: Text('Submit',style: TextStyle(color: Colors.white))),
                    ),
                  );
                }),
                // Obx(() {
                //   return MButton(
                //     backgroundColor: Colors.green.shade500,
                //     onPressed: content.value.trim() == initialValue.trim()
                //         ? null
                //         : () {
                //       onSubmit(content.value);
                //       Get.back();
                //     },
                //     label: "Submit",
                //   );
                // }),
              ],
            ),
          ],
        ),
      ),
    );
  }
  final InAppReview inAppReview = InAppReview.instance;

  Future<void> _requestReview() async {
    log('in app review is called');
    // Check if the in-app review feature is available
    if (await inAppReview.isAvailable()) {
      final prefs = await SharedPreferences.getInstance();
      final lastRequested = prefs.getInt('last_review_request') ?? 0;
      final now = DateTime.now().millisecondsSinceEpoch;

      // Check if 30 minutes (1800000 milliseconds) have passed since the last request
      if (now - lastRequested > 1 * 60 * 1000) { // 1 minutes
        inAppReview.requestReview();
        prefs.setInt('last_review_request', now);
      }else{
        log('Not enough time passed since the last request.');
      }
    }else{
      log('In-app review is not available.');
    }
  }
}
