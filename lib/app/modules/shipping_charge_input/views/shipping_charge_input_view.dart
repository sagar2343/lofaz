import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lofaz/app/utils/m_button.dart';

import '../controllers/shipping_charge_input_controller.dart';

class ShippingChargeInputView extends GetView<ShippingChargeInputController> {
  const ShippingChargeInputView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Charge'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          TextFormField(
            onChanged: (value) {
              controller.inputShippingCharge.value = controller
                  .inputShippingCharge.value
                  .copyWith(shippingCost: double.tryParse(value));
            },
            initialValue:
                controller.inputShippingCharge.value.shippingCost?.toString(),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              labelText: "Deliver Charge per order (₹)",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            onChanged: (value) {
              controller.inputShippingCharge.value = controller
                  .inputShippingCharge.value
                  .copyWith(freeShippingAfter: double.tryParse(value));
            },
            initialValue: controller.inputShippingCharge.value.freeShippingAfter
                ?.toString(),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              labelText: "Free delivery above (₹)",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 45,
            child: MButton(
              label: "Update",
              onPressed: () {
                controller.updateShippingClicked();
              },
            ),
          )
        ],
      ),
    );
  }
}
