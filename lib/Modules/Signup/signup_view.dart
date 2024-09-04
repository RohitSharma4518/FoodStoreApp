import 'package:flutter/material.dart';
import 'package:foodstore/Modules/Login/Widgets/custom_login_textfield.dart';
import 'package:foodstore/Modules/Signup/signup_controller.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:foodstore/Utils/Constants/asset_constant.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/Constants/string_constant.dart';
import 'package:foodstore/Utils/Constants/widget_constant.dart';
import 'package:foodstore/Utils/Widgets/custom_richtext_widget.dart';
import 'package:foodstore/Utils/Widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});
  @override
  State<StatefulWidget> createState() {
    return _SignupViewState();
  }
}

class _SignupViewState extends State<SignupView> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.find();

    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 8.8.h,
            left: 5.7.w,
            right: 5.7.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 65.w,
                child: const CustomTextWidget(
                  StringConstants.registerHeadTxt,
                  fontSize: 25,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 0.9.h,
              ),
              SizedBox(
                width: 75.w,
                child: const CustomTextWidget(
                  StringConstants.registerSubHeadTxt,
                  color: ColorConstants.dividerColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 10.5,
                  textAlign: TextAlign.left,
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 1.4.h,
                    ),
                    const CustomTextWidget(
                      StringConstants.registerEmailTxt,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.3,
                    ),
                    SizedBox(
                      height: 0.9.h,
                    ),
                    CustomTextField(
                      controller: emailController,
                      hintText: StringConstants.loginHintEmailTxt,
                      hintTextColor: ColorConstants.dividerColor,
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
                      height: 1.4.h,
                    ),
                    const CustomTextWidget(
                      StringConstants.registerUNameTxt,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.3,
                    ),
                    SizedBox(
                      height: 0.9.h,
                    ),
                    CustomTextField(
                      controller: nameController,
                      hintText: StringConstants.registerHintUserNameTxt,
                      hintTextColor: ColorConstants.dividerColor,
                      validator: (val) {
                        if (val!.isEmpty ||
                            !RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(val)) {
                          return StringConstants.registerNameErrorTxt;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 1.4.h,
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
                          controller: passwordController,
                          hintText: StringConstants.loginHintPasswordTxt,
                          hintTextColor: ColorConstants.dividerColor,
                          obscureText:
                              signupController.isPasswordObscured.value,
                          showPasswordIcon: true,
                          onIconPressed:
                              signupController.togglePasswordVisibility,
                          validator: (val) {
                            if (val!.isEmpty ||
                                !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$')
                                    .hasMatch(val)) {
                              return StringConstants.registerPasswordErrorTxt;
                            } else {
                              return null;
                            }
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.6.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => SizedBox(
                      height: 2.2.h,
                      width: 5.w,
                      child: Checkbox.adaptive(
                        value: signupController.agreeToTerms.value,
                        onChanged: (bool? val) {
                          signupController.agreeToTerms.value =
                              !signupController.agreeToTerms.value;
                        },
                        activeColor: ColorConstants.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.9.h,
                  ),
                  SizedBox(
                    width: 65.w,
                    child: const CustomRichText(
                      text1: StringConstants.registerTermsTxt1,
                      text2: StringConstants.registerTermsTxt2,
                      text3: StringConstants.registerTermsTxt3,
                      text4: StringConstants.registerTermsTxt4,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.8.h,
              ),
              ThemeBtn(
                btnName: StringConstants.registerBtnTxt,
                btnAction: () {
                  if (formKey.currentState!.validate() &&
                      signupController.agreeToTerms.value == true) {
                    signupController.registerUser(
                      nameController.text.trim(),
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                  }
                },
              ),
              SizedBox(
                height: 2.8.h,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 15.0),
                      child: Divider(
                        color: ColorConstants.dividerColor,
                        height: 0.5.h,
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
                        height: 0.5.h,
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
              SizedBox(height: 3.7.h),
              Align(
                alignment: Alignment.center,
                child: CustomRichText(
                  text1: StringConstants.registerBottomTxt1,
                  tappableText: StringConstants.registerBottomTxt2,
                  onTap: () {
                    Get.toNamed(AppRoutes.loginScreen);
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
