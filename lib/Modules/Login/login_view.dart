import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodstore/Modules/Login/Widgets/custom_login_textfield.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:foodstore/Utils/Constants/asset_constant.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/Constants/widget_constant.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() {
    return _LoginViewState();
  }
}

class _LoginViewState extends State<LoginView> {
  bool passwordVisible = true;

  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.only(
                top: 76, bottom: 137, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 200.0,
                  child: Text(
                    'Login to your account',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Please sign in to your account',
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
                  hint: 'Enter Email',
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text('Password'),
                const SizedBox(
                  height: 8,
                ),
                CustomPasswordTextField(
                  controller: _password,
                  hint: "Password",
                  secureText: passwordVisible,
                  suffixIcon: IconButton(
                    onPressed: () => setState(
                      () {
                        passwordVisible = !passwordVisible;
                      },
                    ),
                    icon: Icon(passwordVisible
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined),
                  ),
                  // validator: Validator.validatePassword,
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.forgotPswdScreen);
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.primaryColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ThemeBtn(
                  btnName: 'Sign In',
                  btnAction: () {
                    print("Login pressed");
                    Get.toNamed(AppRoutes.navBarScreen);
                  },
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
                        margin: const EdgeInsets.only(left: 15.0, right: 10.0),
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
                              Get.toNamed(AppRoutes.signupScreen);
                            },
                          text: 'Register',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: ColorConstants.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
