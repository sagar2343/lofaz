import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lofaz/app/utils/widgets/T4Button.dart';
import 'package:nb_utils/nb_utils.dart';

class StoreCloseBottomSheet extends StatelessWidget {
  StoreCloseBottomSheet({super.key});
  final selectedTime = Rxn<String>();

  final timeOptions = [
    {1: "1 hour"},
    {2: "2 hour"},
    {4: "4 hour"},
    {8: "8 hour"},
    {12: "Tomorrow"},
    {null: "I will open my self"},
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Obx(() {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: const Text("Open Store after"),
              actions: [
                IconButton(
                    onPressed: () {
                      Get.back(result: (false, null));
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            ...timeOptions.map((e) => RadioMenuButton(
                value: e.values.first,
                groupValue: selectedTime.value,
                onChanged: (v) {
                  selectedTime.value = v;
                },
                child: Text(e.values.first))),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: T4Button(
                  textContent: "CONTINUE",
                  onPressed: () {
                    if (selectedTime.value == null) {
                      toast("Please select time");
                      return;
                    }

                    Get.back(
                      result: (
                        true,
                        timeOptions
                            .where((element) =>
                                element.values.contains(selectedTime.value))
                            .first
                            .keys
                            .first
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      }),
    );
  }
}
