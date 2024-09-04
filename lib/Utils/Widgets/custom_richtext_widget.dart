import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';

class CustomRichText extends StatelessWidget {
  final String? text1;
  final String? tappableText;
  final String? text2;
  final String? text3;
  final String? text4;

  final void Function()? onTap;
  final TextStyle? text1Style;
  final TextStyle? text2Style;
  final TextStyle? text3Style;
  final TextStyle? text4Style;

  final TextStyle? tappableTextStyle;

  const CustomRichText({
    super.key,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.tappableText,
    this.onTap,
    this.text1Style,
    this.text2Style,
    this.text3Style,
    this.text4Style,
    this.tappableTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: text1,
            style: text1Style ??
                const TextStyle(
                  fontSize: 14,
                  color: ColorConstants.blackColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
          TextSpan(
            text: text2,
            style: text2Style ??
                const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.primaryColor,
                ),
          ),
          TextSpan(
            text: text3,
            style: text3Style ??
                const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.blackColor,
                ),
          ),
          TextSpan(
            text: text4,
            style: text4Style ??
                const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.primaryColor,
                ),
          ),
          TextSpan(
            text: tappableText,
            style: tappableTextStyle ??
                const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.primaryColor,
                ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
