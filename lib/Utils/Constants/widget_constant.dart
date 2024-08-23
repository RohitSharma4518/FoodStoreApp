import 'package:flutter/material.dart';
import 'package:foodstore/Modules/Cart/cart_controller.dart';
import 'package:foodstore/Utils/Constants/asset_constant.dart';
import 'package:foodstore/Utils/Constants/string_constant.dart';
import 'package:foodstore/Utils/Widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:sizer/sizer.dart';

class WidgetConstants {
  ///
  /// This method is used for show text in ui with some prebuild properties
  static Text text(String text,
      {Color color = ColorConstants.textPrimaryColor,
      FontWeight fontWeight = FontWeight.normal,
      double fontSize = 16.0,
      double letterSpacing = 0.5,
      TextOverflow? textOverflow,
      TextAlign textAlign = TextAlign.center,
      int? maxLine,
      TextDecoration decoration = TextDecoration.none}) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      maxLines: maxLine,
      style: TextStyle(
        decoration: decoration,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      ),
    );
  }

  ///
  /// Error SnackBar
  static errorSnackBar({
    required String content,
    Color textColor = ColorConstants.whiteColor,
  }) {
    return Get.snackbar(
      'Error',
      content,
      backgroundColor: Colors.red[400],
      colorText: textColor,
      borderRadius: 10,
    );
  }

  ///
  /// Success SnackBar
  static successSnackBar({
    required String content,
    Color textColor = ColorConstants.blackColor,
  }) {
    return Get.snackbar(
      'Success',
      content,
      backgroundColor: Colors.green[100]!.withOpacity(0.8),
      borderRadius: 6,
      colorText: textColor,
    );
  }
}

class CustomAddToCartBtn extends StatelessWidget {
  const CustomAddToCartBtn(
      {super.key, this.btnIcon, required this.btnName, this.btnAction});

  final IconData? btnIcon;
  final String? btnName;
  final void Function()? btnAction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton.icon(
        onPressed: btnAction,
        label: Text(
          btnName!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        icon: Icon(
          btnIcon,
          size: 20,
        ),
        style: TextButton.styleFrom(
          backgroundColor: ColorConstants.primaryColor,
          foregroundColor: ColorConstants.whiteColor,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}

class ThemeBtn extends StatelessWidget {
  const ThemeBtn(
      {super.key,
      this.btnIcon,
      required this.btnName,
      required this.btnAction});

  final IconData? btnIcon;
  final String? btnName;
  final void Function() btnAction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton.icon(
        onPressed: btnAction,
        label: Text(
          btnName!,
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: ColorConstants.whiteColor),
        ),
        style: TextButton.styleFrom(
          backgroundColor: ColorConstants.primaryColor,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}

class CustomPasswordTextField extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final Color? baseColor;
  final Color? errorColor;
  final TextInputType inputType;
  final Function? validator;
  final Function? onChanged;
  final Widget? suffixIcon;
  final bool? secureText;

  const CustomPasswordTextField(
      {this.hint,
      this.controller,
      this.onChanged,
      this.baseColor,
      this.errorColor,
      this.inputType = TextInputType.text,
      this.validator,
      this.suffixIcon,
      this.secureText,
      super.key});

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  late Color currentColor;
  bool passwordVisible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.inputType,
      onChanged: (text) {
        if (widget.onChanged != null) {
          widget.onChanged!(text);
        }
        setState(() {
          if (!widget.validator!(text) || text.length == 0) {
            currentColor = widget.errorColor!;
          } else {
            currentColor = widget.baseColor!;
          }
        });
      },
      obscureText: widget.secureText!,
      decoration: InputDecoration(
        border: InputBorder.none,
        suffixIcon: widget.suffixIcon,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstants.textFieldBorderColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstants.textFieldBorderColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(color: ColorConstants.dividerColor),
        fillColor: Colors.white,
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final Color? baseColor;
  final Color? errorColor;
  final TextInputType inputType;
  final Function? validator;
  final Function? onChanged;
  final Widget? suffixIcon;

  const CustomTextField(
      {this.hint,
      this.controller,
      this.onChanged,
      this.baseColor,
      this.errorColor,
      this.inputType = TextInputType.text,
      this.validator,
      this.suffixIcon,
      super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late Color currentColor;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.inputType,
      onChanged: (text) {
        if (widget.onChanged != null) {
          widget.onChanged!(text);
        }
        setState(() {
          if (!widget.validator!(text) || text.isEmpty) {
            currentColor = widget.errorColor!;
          } else {
            currentColor = widget.baseColor!;
          }
        });
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstants.textFieldBorderColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstants.textFieldBorderColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(color: ColorConstants.dividerColor),
        fillColor: Colors.white,
      ),
    );
  }
}
