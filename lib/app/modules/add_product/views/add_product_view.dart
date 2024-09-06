import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:lofaz/app/data/models/catalog/catalog.dart';
import 'package:lofaz/app/data/models/product/product_unit.dart';
import 'package:lofaz/app/routes/app_pages.dart';
import 'package:lofaz/app/utils/AppConstant.dart';
import 'package:lofaz/app/utils/AppWidget.dart';
import 'package:lofaz/app/utils/m_button.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/T4Colors.dart';
import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.isEditMode ? 'Edit Product' : 'Add Product'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: InkWell(
                    onTap: () {
                      controller.pickImage();
                    },
                    child: Card(
                      child: SizedBox(
                        width: 200,
                        child: Obx(() {
                          return AspectRatio(
                            aspectRatio: 1,
                            child: controller.imageExistInOld()
                                ? CachedNetworkImage(
                                    imageUrl: controller.getOldImageUrl)
                                : controller.selectedImagePath.value != null
                                    ? Image.file(
                                        File(controller.selectedImagePath.value!),
                                        fit: BoxFit.fill)
                                    : const Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Bootstrap.camera,
                                                color: black,
                                                size: 50,
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "Add Product Feature Image Recommended Size: 800x800",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
              35.height,
              TextFormField(
                initialValue: !controller.isEditMode
                    ? null
                    : controller.productName.value,
                autovalidateMode: AutovalidateMode.onUserInteraction,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Product name can\'t be blank';
                  }
                  return null;
                },
                onChanged: (value) {
                  controller.productName.value = value;
                },
                style: primaryTextStyle(size: 18),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9- ]")),
                ],
                maxLength: 70,
                // obscureText: isPassword,
                decoration: InputDecoration(
                  counterText: '',
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(18, 8, 4, 8),
                  hintText: "Product Name",
                  labelText: "Product Name*",
                  filled: true,
                  fillColor: t3_edit_background,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                        color: t4_textColorSecondary, width: 0.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                        color: t4_textColorSecondary, width: 0.0),
                  ),
                ),
              ),
              14.height,
              Row(
                children: [
                  Expanded(
                    child: Obx(() {
                      return DropdownButtonFormField<Catalog>(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null) {
                            return 'Please select category';
                          }
                          return null;
                        },
                        value: controller.selectedCatalog.value,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(18, 8, 4, 8),
                          hintText: "Select Category*",
                          filled: true,
                          fillColor: t3_edit_background,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                                color: t4_textColorSecondary, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                                color: t4_textColorSecondary, width: 0.0),
                          ),
                        ),
                        // value: dropdownValue,
                        elevation: 16,
                        style: primaryTextStyle(),

                        isExpanded: true,

                        onChanged: (newValue) {
                          controller.selectedCatalog.value = newValue;
                        },
                        items: controller.catalogs
                            .map<DropdownMenuItem<Catalog>>((Catalog value) {
                          return DropdownMenuItem<Catalog>(
                            value: value,
                            child: Text(value.title),
                          );
                        }).toList(),
                      );
                    }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  MButton(
                      onPressed: () {
                        Get.toNamed(Routes.ADD_CATEGORY);
                      },
                      icon: Icons.add,
                      verticalPadding: 8,
                      label: "Catagory"),
                ],
              ),
              14.height,
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: !controller.isEditMode
                          ? null
                          : controller.price.value.toString(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please add price';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        controller.price.value = value.toDouble();
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      // style: primaryTextStyle(size: 18),
                      // obscureText: isPassword,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.fromLTRB(18, 8, 4, 8),
                        hintText: "Price",
                        labelText: "Price (₹)",
                        filled: true,
                        fillColor: t3_edit_background,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                              color: t4_textColorSecondary, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                              color: t4_textColorSecondary, width: 0.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    // flex: 3,
                    child: TextFormField(
                      validator: (value) {
                        if (value != null) {
                          final price = double.tryParse(value);
                          if (price != null) {
                            if (price > (controller.price.value ?? 0)) {
                              return 'should be less than price';
                            }
                          }
                        }
                        return null;
                      },

                      initialValue: !controller.isEditMode
                          ? null
                          : controller.salePrice.value.toString(),
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {
                        controller.salePrice.value = value.toDouble();
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      // style: primaryTextStyle(size: 18),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        isDense: true,
                        contentPadding: const EdgeInsets.fromLTRB(18, 8, 4, 8),
                        hintText: "sale price",
                        labelText: "Discounted Price (₹)",
                        filled: true,
                        fillColor: t3_edit_background,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                              color: t4_textColorSecondary, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                              color: t4_textColorSecondary, width: 0.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Obx(() {
                  final showSalePrice = controller.salePrice.value != null &&
                      controller.salePrice.value != 0;

                  return Row(
                    children: [
                      const Text("Price:"),
                      if (showSalePrice)
                        Text("₹ ${controller.salePrice.value} "),
                      Text(
                        "₹ ${controller.price.value ?? 0.0}",
                        style: showSalePrice
                            ? const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2,
                                color: Colors.grey,
                              )
                            : null,
                      ),
                      const Spacer(),
                      Material(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            child: Text(
                              "${controller.getDiscount()}% OFF",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ],
                  );
                }),
              ),
              // 10.height,
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      initialValue: !controller.isEditMode
                          ? null
                          : controller.unitCount.value.toString(),
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please add quantity';
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        controller.unitCount.value = value.toDouble();
                      },
                      style: primaryTextStyle(size: 18),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        isDense: true,
                        contentPadding: const EdgeInsets.fromLTRB(18, 8, 4, 8),
                        hintText: "Quantity",
                        labelText: "Products unit*",
                        hintStyle: const TextStyle(
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: t3_edit_background,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                              color: t4_textColorSecondary, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                              color: t4_textColorSecondary, width: 0.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    flex: 2,
                    child: Obx(() {
                      return DropdownButtonFormField<ProductUnit>(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null) {
                            return 'Please select unit';
                          }
                          return null;
                        },
                        value: controller.selectedUnit.value,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          isDense: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(18, 8, 4, 8),
                          hintText: "Select Unit",
                          labelText: "Unit Type*",
                          hintStyle: const TextStyle(
                            fontSize: 12,
                          ),
                          filled: true,
                          fillColor: t3_edit_background,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                                color: t4_textColorSecondary, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                                color: t4_textColorSecondary, width: 0.0),
                          ),
                        ),
                        elevation: 16,
                        isExpanded: false,
                        onChanged: (newValue) {
                          controller.selectedUnit.value = newValue;
                        },
                        items: controller.units
                            .map<DropdownMenuItem<ProductUnit>>(
                                (ProductUnit value) {
                          return DropdownMenuItem<ProductUnit>(
                            value: value,
                            child: Text(
                              value.unit,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      initialValue: !controller.isEditMode
                          ? null
                          : controller.stock.value?.toString(),
                      onChanged: (value) {
                        controller.stock.value = value.toInt();
                      },
                      style: primaryTextStyle(size: 18),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      // obscureText: isPassword,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.fromLTRB(18, 8, 4, 8),
                        hintText: "Stock",
                        labelText: "Stock",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintStyle: const TextStyle(
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: t3_edit_background,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                              color: t4_textColorSecondary, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                              color: t4_textColorSecondary, width: 0.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // 10.height,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Obx(() {
                  return Row(
                    children: [
                      const Text("Unit:"),
                      Text(
                        "${controller.unitCount.value?.toInt() ?? "0"} ",
                      ),
                      Text(controller.selectedUnit.value?.unit ?? "unit"),
                    ],
                  );
                }),
              ),
              TextFormField(
                maxLines: 3,
                initialValue: !controller.isEditMode
                    ? null
                    : controller.description.value,
                onChanged: (value) {
                  controller.description.value = value;
                },
                style: primaryTextStyle(size: 18),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(18, 8, 4, 8),
                  labelText: "Product Details",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter Product Details",
                  filled: true,
                  fillColor: t3_edit_background,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                        color: t4_textColorSecondary, width: 0.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                        color: t4_textColorSecondary, width: 0.0),
                  ),
                ),
              ),
              // 10.height,

              // const Divider(
              //   height: 0,
              //   color: t4_textColorSecondary,
              // ),
              10.height,
              text("Product Label"),
              Obx(() {
                return Row(
                  children: [
                    RadioMenuButton<ProductLabel>(
                        value: ProductLabel.NEW,
                        groupValue: controller.selectedLabel.value,
                        onChanged: (v) {
                          controller.selectedLabel.value = v!;
                        },
                        child: const Text("New")),
                    RadioMenuButton(
                        value: ProductLabel.HOT,
                        groupValue: controller.selectedLabel.value,
                        onChanged: (v) {
                          controller.selectedLabel.value = v!;
                        },
                        child: const Text("Hot")),
                    RadioMenuButton(
                        value: ProductLabel.NONE,
                        groupValue: controller.selectedLabel.value,
                        onChanged: (v) {
                          controller.selectedLabel.value = v!;
                        },
                        child: const Text("None")),
                  ],
                );
              }),
              10.height,
              Obx(() {
                return SizedBox(
                  width: Get.width * 0.5,
                  child: SwitchListTile(
                    title: const Text("Active"),
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.red,
                    value: controller.isActive.value,
                    onChanged: (v) {
                      controller.isActive.value = v;
                    },
                  ),
                );
              }),
              30.height,
              SizedBox(
                width: double.maxFinite,
                child: MButton(
                    verticalPadding: 10,
                    label: controller.isEditMode
                        ? "Update Product"
                        : "Add Product",
                    onPressed: () {
                      controller.addProduct();
                      Future.delayed(Duration(seconds: 2), () {
    _requestReview();
  });
                    }),
              ),
              120.height,
            ],
          ),
        ),
      ),
    );
  }
  final InAppReview inAppReview = InAppReview.instance;

  Future<void> _requestReview() async {
    // Check if the in-app review feature is available
    if (await inAppReview.isAvailable()) {
      final prefs = await SharedPreferences.getInstance();
      final lastRequested = prefs.getInt('last_review_request') ?? 0;
      final now = DateTime.now().millisecondsSinceEpoch;

      // Check if 30 minutes (1800000 milliseconds) have passed since the last request
      if (now - lastRequested > 30 * 60 * 1000) { // 30 minutes
        inAppReview.requestReview();
        prefs.setInt('last_review_request', now);
      }
    }
  }
}
