import 'package:flutter/material.dart';
import 'package:lofaz/app/utils/T4Colors.dart';

class MButton extends StatelessWidget {
  final Color backgroundColor;
  final Color forgroundColor;
  final String label;
  final IconData? icon;
  final Function()? onPressed;
  final double verticalPadding;
  const MButton({
    super.key,
    this.backgroundColor = t2_colorPrimary,
    this.forgroundColor = Colors.white,
    required this.label,
    this.icon,
    this.onPressed,
    this.verticalPadding = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      color: backgroundColor,
      textColor: forgroundColor,
      onPressed: onPressed,
      disabledColor: Theme.of(context).disabledColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              )
            ],
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
