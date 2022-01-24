import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? underLine;
  final TextAlign? textAlign;

  TextUtils({
    this.fontSize,
    this.fontWeight,
    this.text,
    this.color,
    this.underLine,
    this.textAlign,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          decoration: underLine,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
      textAlign: textAlign,
    );
  }
}
