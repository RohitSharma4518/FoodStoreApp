import 'package:flutter/material.dart';
import 'package:foodstore/Modules/Login/Widgets/custom_login_textfield.dart';
import 'package:foodstore/Modules/Login/login_controller.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:foodstore/Utils/Constants/asset_constant.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/Constants/string_constant.dart';
import 'package:foodstore/Utils/Constants/widget_constant.dart';
import 'package:foodstore/Utils/Widgets/custom_richtext_widget.dart';
import 'package:foodstore/Utils/Widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({super.key});
  final LoginController _loginController = Get.find();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 8.3.h, left: 5.6.w, right: 5.6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 55.w,
                child: const CustomTextWidget(
                  StringConstants.loginHeadTxt,
                  fontSize: 25,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 0.9.h,
              ),
              const CustomTextWidget(
                StringConstants.loginSubHeadTxt,
                color: ColorConstants.dividerColor,
                fontWeight: FontWeight.w500,
                fontSize: 10.5,
              ),
              SizedBox(
                height: 3.6.h,
              ),
              const CustomTextWidget(
                StringConstants.registerEmailTxt,
                fontWeight: FontWeight.w500,
                fontSize: 10.3,
              ),
              Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 0.9.h,
                    ),
                    CustomTextField(
                      hintTextColor: ColorConstants.dividerColor,
                      hintText: StringConstants.loginHintEmailTxt,
                      controller: _emailController,
                      validator: (val) {
                        if (val!.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                .hasMatch(val)) {
                          return StringConstants.registerEmailErrorTxt;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 1.6.h,
                    ),
                    const CustomTextWidget(
                      StringConstants.registerPassTxt,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.3,
                    ),
                    SizedBox(
                      height: 0.9.h,
                    ),
                    Obx(
                      () => CustomTextField(
                        controller: _passwordController,
                        hintTextColor: ColorConstants.dividerColor,
                        hintText: StringConstants.loginHintPasswordTxt,
                        obscureText: _loginController.passwordVisible.value,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Password Field Cannot be Empty!";
                          } else {
                            return null;
                          }
                        },
                        showPasswordIcon: true,
                        onIconPressed:
                            _loginController.togglePasswordVisibility,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.8.h,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.forgotPswdScreen);
                  },
                  child: const CustomTextWidget(
                    StringConstants.loginForgotpassTxt,
                    fontSize: 10.5,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 1.8.h,
              ),
              ThemeBtn(
                btnName: StringConstants.loginBtnTxt,
                btnAction: () {
                  if (formkey.currentState!.validate()) {
                    _loginController.signInWithEmailPassword(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                    );
                  }
                },
              ),
              SizedBox(
                height: 2.7.h,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 15.0),
                      child: Divider(
                        color: ColorConstants.dividerColor,
                        height: 0.04.h,
                      ),
                    ),
                  ),
                  const CustomTextWidget(
                    StringConstants.loginSigninOptionTxt,
                    fontSize: 10.5,
                    color: ColorConstants.dividerColor,
                    fontWeight: FontWeight.w500,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                      child: Divider(
                        color: ColorConstants.dividerColor,
                        height: 0.04.h,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AuthOption(imagePath: AssetConstant.authGoogleImg),
                  SizedBox(
                    width: 3.9.w,
                  ),
                  const AuthOption(imagePath: AssetConstant.authFbImg),
                  SizedBox(
                    width: 3.9.w,
                  ),
                  const AuthOption(imagePath: AssetConstant.authAppleImg),
                ],
              ),
              SizedBox(
                height: 3.6.h,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomRichText(
                  text1: StringConstants.loginNewAcntHintTxt1,
                  tappableText: StringConstants.loginNewAcntHintTxt2,
                  onTap: () {
                    Get.toNamed(AppRoutes.signupScreen);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
