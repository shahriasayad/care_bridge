import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTextStyle({
  bool isUnderline = false,
  double fontSize = 14.0,
  FontWeight fontWeight = FontWeight.w400,
  TextAlign textAlign = TextAlign.center,
  Color color = Colors.black,
}) {
  return GoogleFonts.inter(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
  );
}
