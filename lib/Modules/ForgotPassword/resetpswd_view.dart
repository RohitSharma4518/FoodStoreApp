import 'package:flutter/material.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:foodstore/Utils/Constants/asset_constant.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/Constants/widget_constant.dart';
import 'package:get/get.dart';

class ResetpswdView extends StatefulWidget {
  const ResetpswdView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ResetpswdViewState();
  }
}

class _ResetpswdViewState extends State<ResetpswdView> {
  bool passwordVisible = true;
  bool passwordVisible2 = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        leading: Container(
          margin: const EdgeInsets.only(left: 24),
          decoration: BoxDecoration(
            border: Border.all(color: ColorConstants.appBarColor, width: 1),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            padding: const EdgeInsets.all(1),
            iconSize: 24,
            icon: const Icon(
              Icons.chevron_left_sharp,
              color: ColorConstants.blackColor,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        leadingWidth: 60,
        toolbarHeight: 60,
        title: const Text(
          'Reset Password',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: ColorConstants.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          margin:
              const EdgeInsets.only(top: 28, bottom: 32, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'Reset password?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Your new password must be different from the previously used password',
                style: TextStyle(
                    color: ColorConstants.dividerColor,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text('New Password'),
              const SizedBox(
                height: 8,
              ),
              const CustomTextField(
                hint: 'New Password',
              ),
              const SizedBox(
                height: 24,
              ),
              const Text('Confirm Password'),
              const SizedBox(
                height: 8,
              ),
              CustomPasswordTextField(
                controller: _password,
                hint: "Confirm Password",
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
                height: 248,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ThemeBtn(
                  btnName: 'Verify Account',
                  btnAction: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 492,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.asset(AssetConstant.bottomSheetImg),
                                const SizedBox(
                                  height: 32,
                                ),
                                const Text(
                                  'Password Changed',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                const SizedBox(
                                  width: 327,
                                  child: Text(
                                    'Password changed successfully, you can login again with a new password',
                                    style: TextStyle(
                                      color: ColorConstants.dividerColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                SizedBox(
                                  width: 312,
                                  child: ThemeBtn(
                                    btnName: 'Verify Account',
                                    btnAction: () {
                                      Get.toNamed(AppRoutes.loginScreen);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
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
