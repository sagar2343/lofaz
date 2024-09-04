import 'package:flutter/material.dart';
import 'package:lofaz/app/utils/T4Colors.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomTab extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  const CustomTab(
      {super.key,
      required this.label,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 80,
      ),
      child: InkWell(
        onTap: onTap,
        child: Material(
          color: isActive ? t2_colorPrimary : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: isActive ? t2_colorPrimary : t2_colorPrimary,
            ),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              label,
              style: primaryTextStyle(
                color: isActive ? Colors.white : t2_colorPrimary,
                weight: isActive ? FontWeight.bold : null,
              ),
            ),
          )),
        ),
      ),
    );
  }
}
