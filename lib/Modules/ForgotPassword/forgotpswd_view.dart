import 'package:flutter/material.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/Constants/widget_constant.dart';
import 'package:get/get.dart';

class ForgotpswdView extends StatefulWidget {
  const ForgotpswdView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ForgotpswdViewState();
  }
}

class _ForgotpswdViewState extends State<ForgotpswdView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          margin:
              const EdgeInsets.only(top: 76, bottom: 137, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Forgot password?',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Enter your email address and we’ll send you confirmation code to reset your password',
                style: TextStyle(
                    color: ColorConstants.dividerColor,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text('Email Address'),
              const SizedBox(
                height: 8,
              ),
              const CustomTextField(
                hint: "Enter Email",
              ),
              const SizedBox(
                height: 161,
              ),
              ThemeBtn(
                btnName: 'Continue',
                btnAction: () => Get.toNamed(AppRoutes.resetPswdScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
