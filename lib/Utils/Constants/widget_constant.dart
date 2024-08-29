import 'package:flutter/material.dart';
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
          if (!widget.validator!(text) || text.isEmpty) {
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

// class CustomTextField extends StatefulWidget {
//   final String? hint;
//   final TextEditingController? controller;
//   final Color? baseColor;
//   final Color? errorColor;
//   final TextInputType inputType;
//   final Function? validator;
//   final Function? onChanged;
//   final Widget? suffixIcon;

//   const CustomTextField(
//       {this.hint,
//       this.controller,
//       this.onChanged,
//       this.baseColor,
//       this.errorColor,
//       this.inputType = TextInputType.text,
//       this.validator,
//       this.suffixIcon,
//       super.key});

//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<CustomTextField> {
//   late Color currentColor;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       keyboardType: widget.inputType,
//       onChanged: (text) {
//         if (widget.onChanged != null) {
//           widget.onChanged!(text);
//         }
//         setState(() {
//           if (!widget.validator!(text) || text.isEmpty) {
//             currentColor = widget.errorColor!;
//           } else {
//             currentColor = widget.baseColor!;
//           }
//         });
//       },
//       decoration: InputDecoration(
//         border: InputBorder.none,
//         focusedBorder: const OutlineInputBorder(
//           borderSide: BorderSide(
//             color: ColorConstants.textFieldBorderColor,
//             width: 1.0,
//           ),
//           borderRadius: BorderRadius.all(
//             Radius.circular(8),
//           ),
//         ),
//         enabledBorder: const OutlineInputBorder(
//           borderSide: BorderSide(
//             color: ColorConstants.textFieldBorderColor,
//             width: 1.0,
//           ),
//           borderRadius: BorderRadius.all(
//             Radius.circular(8),
//           ),
//         ),
//         hintText: widget.hint,
//         hintStyle: const TextStyle(color: ColorConstants.dividerColor),
//         fillColor: Colors.white,
//       ),
//     );
//   }
// }

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  // ignore: library_private_types_in_public_api
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 60),
    );
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.linear),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 11.w,
            height: 3.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: _circleAnimation!.value == Alignment.centerLeft
                  ? ColorConstants.primaryColor
                  : Colors.grey,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 1.0, left: 1.0),
              child: Container(
                alignment: widget.value
                    ? ((Directionality.of(context) == TextDirection.rtl)
                        ? Alignment.centerRight
                        : Alignment.centerLeft)
                    : ((Directionality.of(context) == TextDirection.rtl)
                        ? Alignment.centerLeft
                        : Alignment.centerRight),
                child: Container(
                  width: 6.w,
                  height: 2.4.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String obscuringCharacter;
  final Color hintTextColor;
  final bool isDropdown;
  final List<String>? dropdownItems;
  final bool isDatePicker;
  final bool isPhoneNumber;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onIconPressed;
  final bool showPasswordIcon;
  final bool? nonEditableField;
  final String? Function(String? val)? validator;

  const CustomTextField({
    super.key,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.obscuringCharacter = '*',
    this.hintTextColor = ColorConstants.blackColor,
    this.isDropdown = false,
    this.dropdownItems,
    this.isDatePicker = false,
    this.isPhoneNumber = false,
    this.controller,
    this.onChanged,
    this.onIconPressed,
    this.validator,
    this.nonEditableField,
    this.showPasswordIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isDropdown && dropdownItems != null) {
      return DropdownButtonFormField<String>(
        dropdownColor: ColorConstants.whiteColor,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: ColorConstants.appBarColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: ColorConstants.appBarColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: ColorConstants.appBarColor,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          contentPadding: const EdgeInsets.all(16),
        ),
        items: dropdownItems!.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newValue) {
          if (onChanged != null) {
            onChanged!(newValue!);
          }
        },
        value: controller?.text.isNotEmpty ?? false ? controller?.text : null,
      );
    } else if (isDatePicker) {
      return GestureDetector(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );

          if (pickedDate != null) {
            String formattedDate = "${pickedDate.toLocal()}".split(' ')[0];
            controller?.text = formattedDate;
            if (onChanged != null) {
              onChanged!(formattedDate);
            }
          }
        },
        child: AbsorbPointer(
          child: TextFormField(
            controller: controller,
            validator: validator,
            enabled: nonEditableField,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: ColorConstants.appBarColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: ColorConstants.appBarColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: ColorConstants.dividerColor,
                ),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: hintTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
      );
    } else if (isPhoneNumber) {
      return TextField(
        controller: controller,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: ColorConstants.appBarColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: ColorConstants.appBarColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: ColorConstants.dividerColor,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          contentPadding: const EdgeInsets.all(16),
        ),
      );
    } else {
      return TextFormField(
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText,
        enabled: nonEditableField,
        obscuringCharacter: obscuringCharacter,
        cursorRadius: const Radius.circular(8),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: ColorConstants.appBarColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: ColorConstants.appBarColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: ColorConstants.dividerColor,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          contentPadding: const EdgeInsets.all(16),
          suffixIcon: showPasswordIcon
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: onIconPressed,
                )
              : null,
        ),
        controller: controller,
        onChanged: onChanged,
      );
    }
  }
}
