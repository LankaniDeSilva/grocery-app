import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.textAlign,
    this.fontSize = 15.0,
    this.fontWeight,
    this.color,
  }) : super(key: key);

  final String text;
  final TextAlign? textAlign;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
