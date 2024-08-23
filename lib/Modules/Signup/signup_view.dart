import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodstore/Modules/Login/Widgets/custom_login_textfield.dart';
import 'package:foodstore/Modules/Signup/signup_controller.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:foodstore/Utils/Constants/asset_constant.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/Constants/widget_constant.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:foodstore/Modules/Signup/signup_controller.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.find();
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: SingleChildScrollView(
        child: Container(
            margin:
                const EdgeInsets.only(top: 76, bottom: 34, left: 24, right: 24),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 250.0,
                    child: Text(
                      'Create your new account',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    width: 320,
                    child: Text(
                      'Create an account to start looking for the food you like',
                      style: TextStyle(
                          color: ColorConstants.dividerColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          'Email Address',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextField(
                          hint: "Enter Email",
                          controller: signupController.email,
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        const Text(
                          'User Name',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextField(
                          hint: "User Name",
                          controller: signupController.username,
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        const Text(
                          'Password',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomPasswordTextField(
                          hint: "Password",
                          secureText: signupController.passwordVisible.value,
                          controller: signupController.password,
                          suffixIcon: IconButton(
                            padding: const EdgeInsets.only(right: 20.0),
                            onPressed: () {
                              signupController.passwordVisible.value =
                                  !signupController.passwordVisible.value;
                            },
                            icon: Icon(signupController.passwordVisible.value
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Checkbox.adaptive(
                          value: signupController.agreeToTerms.value,
                          onChanged: (bool? val) {
                            signupController.agreeToTerms.value =
                                !signupController.agreeToTerms.value;
                          },
                          activeColor: ColorConstants.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        width: 260,
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
                  const SizedBox(height: 24),
                  ThemeBtn(
                    btnName: 'Register',
                    btnAction: () {},
                    // btnAction: () {
                    //   print("Pressed");
                    //   if (_formkey.currentState!.validate()) {
                    //     signupController.registerUser(
                    //         signupController.email.text.trim(),
                    //         signupController.password.text.trim());
                    //   }
                    // },
                  ),
                  const SizedBox(height: 24),
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
                      const Text(
                        'Or sign in with',
                        style: TextStyle(
                            color: ColorConstants.dividerColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 15.0, right: 10.0),
                          child: const Divider(
                            color: ColorConstants.dividerColor,
                            height: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AuthOption(imagePath: AssetConstant.authGoogleImg),
                      SizedBox(
                        width: 16,
                      ),
                      AuthOption(imagePath: AssetConstant.authFbImg),
                      SizedBox(
                        width: 16,
                      ),
                      AuthOption(imagePath: AssetConstant.authAppleImg),
                    ],
                  ),
                  const SizedBox(height: 32),
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
            )),
      ),
    );
  }
}
