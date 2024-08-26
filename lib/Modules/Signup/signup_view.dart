import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodstore/Modules/Login/Widgets/custom_login_textfield.dart';
import 'package:foodstore/Modules/Signup/signup_controller.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:foodstore/Utils/Constants/asset_constant.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/Constants/string_constant.dart';
import 'package:foodstore/Utils/Constants/widget_constant.dart';
import 'package:foodstore/Utils/Widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    // SignupController signupController = Get.find();

    final RegisterController _registerController =
        Get.put(RegisterController());

    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final _formkey = GlobalKey<FormState>();
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
                key: _formkey,
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
                    // CustomTextField(
                    //   hint: "Enter Email",
                    //   controller: signupController.email,
                    // ),
                    CustomTextField(
                      controller: _emailController,
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
                      controller: _nameController,
                    ),
                    // CustomTextField(
                    //   hint: "User Name",
                    //   controller: signupController.username,
                    // ),
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
                        controller: _passwordController,
                        obscureText:
                            _registerController.isPasswordObscured.value,
                        obscuringCharacter: '*',
                        showPasswordIcon: true,
                        onIconPressed:
                            _registerController.togglePasswordVisibility,
                      ),
                    ),
                    // CustomPasswordTextField(
                    //   hint: "Password",
                    //   secureText: signupController.passwordVisible.value,
                    //   controller: signupController.password,
                    //   suffixIcon: IconButton(
                    //     padding: const EdgeInsets.only(right: 20.0),
                    //     onPressed: () {
                    //       signupController.passwordVisible.value =
                    //           !signupController.passwordVisible.value;
                    //     },
                    //     icon: Icon(signupController.passwordVisible.value
                    //         ? Icons.visibility_off_outlined
                    //         : Icons.remove_red_eye_outlined),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.6.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.2.h,
                    width: 5.w,
                    child: Checkbox.adaptive(
                      value: true,
                      // signupController.agreeToTerms.value,
                      onChanged: (bool? val) {
                        // signupController.agreeToTerms.value =
                        //     !signupController.agreeToTerms.value;
                      },
                      activeColor: ColorConstants.primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 0.9.h,
                  ),
                  SizedBox(
                    width: 65.w,
                    child: RichText(
                      text: const TextSpan(
                        text: 'I Agree with ',
                        style: TextStyle(
                            color: ColorConstants.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                            text: 'Terms of Service ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: ColorConstants.primaryColor),
                          ),
                          TextSpan(
                            text: 'and ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: ColorConstants.blackColor),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: ColorConstants.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.8.h,
              ),
              ThemeBtn(
                btnName: 'Register',
                btnAction: () {
                  print("SignIn pressed");
                  _registerController.registerUser(
                    _nameController.text.trim(),
                    _emailController.text.trim(),
                    _passwordController.text.trim(),
                  );
                },
                // btnAction: () {
                //   print("Pressed");
                //   if (_formkey.currentState!.validate()) {
                //     signupController.registerUser(
                //         signupController.email.text.trim(),
                //         signupController.password.text.trim());
                //   }
                // },
              ),
              SizedBox(
                height: 2.8.h,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 15.0),
                      child: const Divider(
                        color: ColorConstants.dividerColor,
                        height: 0.5,
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
                      child: const Divider(
                        color: ColorConstants.dividerColor,
                        height: 0.5,
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
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: const TextStyle(
                        color: ColorConstants.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(AppRoutes.loginScreen);
                          },
                        text: 'Sign In',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ColorConstants.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
