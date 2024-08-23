import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(this.text,
      {super.key,
      this.color,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 12.0,
      this.textAlign = TextAlign.center,
      this.letterSpacing = 0.1,
      this.decoration = TextDecoration.none,
      this.maxLine,
      this.textOverflow,
      this.foregroundColor});
  final Color? color;
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final TextOverflow? textOverflow;
  final TextAlign textAlign;
  final int? maxLine;
  final double? letterSpacing;
  final TextDecoration decoration;
  final Paint? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLine,
      softWrap: true,
      style: TextStyle(
          decoration: decoration,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize.sp,
          letterSpacing: letterSpacing,
          foreground: foregroundColor),
    );
  }
}
