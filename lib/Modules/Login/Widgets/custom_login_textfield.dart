import 'package:flutter/material.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';

class CustomLoginTextField extends StatefulWidget {
  const CustomLoginTextField({super.key});

  @override
  State<CustomLoginTextField> createState() => _CustomLoginStateTextField();
}

class _CustomLoginStateTextField extends State<CustomLoginTextField> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class AuthOption extends StatelessWidget {
  const AuthOption({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          width: 1,
          color: ColorConstants.authOptionColor,
        ),
        image: DecorationImage(
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}
