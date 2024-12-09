import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class LargeButtonReusable extends StatelessWidget {
  final String title;
  final double? width;
  final Color? color;
  final double? titleSize;
  final VoidCallback? onTap;

  const LargeButtonReusable({
    super.key,
    required this.title,
    this.width = double.infinity,
    this.color = AppColors.buttonColor,
    this.titleSize = 15,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 50,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: titleSize,
                color: Colors.white,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
