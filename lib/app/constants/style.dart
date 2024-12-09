import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_ordering_app/app/constants/text_size.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//22
TextStyle get bigStyle {
  return GoogleFonts.inter(
      textStyle: TextStyle(fontSize: TextSize.big.sp, color: Colors.black));
}

//22
TextStyle get largeStyle {
  return GoogleFonts.inter(
      textStyle: TextStyle(fontSize: TextSize.large.sp, color: Colors.black));
}

//20
TextStyle get mediumStyle {
  return GoogleFonts.inter(
      textStyle: TextStyle(fontSize: TextSize.medium.sp, color: Colors.black));
}

//17
TextStyle get normalStyle {
  return GoogleFonts.inter(
      textStyle: TextStyle(fontSize: TextSize.normal.sp, color: Colors.black));
}

//15
TextStyle get smallStyle {
  return GoogleFonts.inter(
      textStyle: TextStyle(fontSize: TextSize.small.sp, color: Colors.black));
}

//14
TextStyle get miniStyle {
  return GoogleFonts.inter(
      textStyle: TextStyle(fontSize: TextSize.mini.sp, color: Colors.black));
}
