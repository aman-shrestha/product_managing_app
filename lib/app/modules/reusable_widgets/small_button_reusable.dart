import 'package:flutter/material.dart';
import 'package:product_ordering_app/app/constants/style.dart';

class SmallButtonReusable extends StatelessWidget {
  final Icon icon;
  final String title;
  final VoidCallback? onTap;
  final double? width;
  final Color? color;
  final Color? textColor;
  final Color? iconColor;
  final Color? borderColor;
  const SmallButtonReusable(
      {super.key,
      required this.icon,
      required this.title,
      this.onTap,
      this.width = 150,
      this.color = Colors.white,
      this.textColor = Colors.black,
      this.iconColor,
      this.borderColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
          border: Border.all(
            color: borderColor!,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 5),
              Text(
                title,
                style: smallStyle.copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
