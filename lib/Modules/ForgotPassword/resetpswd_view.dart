import 'package:flutter/material.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:foodstore/Utils/Constants/asset_constant.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/Constants/string_constant.dart';
import 'package:foodstore/Utils/Constants/widget_constant.dart';
import 'package:foodstore/Utils/Widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        leading: Container(
          margin: EdgeInsets.only(left: 5.6.w),
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
        leadingWidth: 14.5.w,
        toolbarHeight: 7.h,
        title: const CustomTextWidget(
          StringConstants.resetPassTxt,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      backgroundColor: ColorConstants.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              top: 3.2.h, bottom: 3.8.h, left: 5.8.w, right: 5.6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const CustomTextWidget(
                StringConstants.resetPassTxt,
                textAlign: TextAlign.center,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 0.9.h,
              ),
              const CustomTextWidget(
                StringConstants.resetPassSubTxt,
                textAlign: TextAlign.left,
                color: ColorConstants.dividerColor,
                fontWeight: FontWeight.w500,
                fontSize: 10.5,
              ),
              SizedBox(
                height: 4.h,
              ),
              const CustomTextWidget(
                StringConstants.resetpassNewPassTxt,
                fontSize: 10.3,
              ),
              SizedBox(
                height: 0.9.h,
              ),
              const CustomTextField(
                hint: 'New Password',
              ),
              SizedBox(
                height: 2.8.h,
              ),
              const CustomTextWidget(
                StringConstants.resetpassNewPassTxt2,
                fontSize: 10.3,
              ),
              SizedBox(
                height: 0.9.h,
              ),
              CustomPasswordTextField(
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
              ),
              SizedBox(
                height: 28.h,
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
                          height: 57.h,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.asset(AssetConstant.bottomSheetImg),
                                SizedBox(
                                  height: 4.h,
                                ),
                                const CustomTextWidget(
                                  StringConstants.resetpassSuccessTxt1,
                                  textAlign: TextAlign.center,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: 1.8.h,
                                ),
                                SizedBox(
                                  width: 70.w,
                                  child: const CustomTextWidget(
                                    StringConstants.resetpassSuccessTxt2,
                                    color: ColorConstants.dividerColor,
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.center,
                                    fontSize: 10.8,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                SizedBox(
                                  width: 80.w,
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
