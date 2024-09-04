import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodstore/Utils/Constants/string_constant.dart';
import 'package:foodstore/Utils/Widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:foodstore/Utils/Constants/asset_constant.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navNewScreen();
    super.initState();
  }

  navNewScreen() {
    Timer(const Duration(seconds: 3), () {
      var isSignedIn = GetStorage().read('isSignedIn') ?? false;
      if (isSignedIn) {
        Get.offNamed(AppRoutes.navBarScreen);
      } else {
        Get.offNamed(AppRoutes.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AssetConstant.splashScreenImage,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin:
                    EdgeInsets.only(left: 7.8.w, right: 7.8.w, bottom: 4.6.h),
                decoration: BoxDecoration(
                  color: ColorConstants.primaryColor,
                  borderRadius: BorderRadius.circular(48.0),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CustomTextWidget(
                        StringConstants.splashHeadTxt1,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: ColorConstants.whiteColor,
                      ),
                      SizedBox(
                        height: 1.8.h,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: CustomTextWidget(
                          StringConstants.splashHeadTxt2,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.5,
                          color: ColorConstants.whiteColor,
                        ),
                      ),
                      SizedBox(
                        height: 13.4.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const CustomTextWidget(
                              StringConstants.splashBtnTxt1,
                              color: ColorConstants.whiteColor,
                              fontSize: 10.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              Get.toNamed(AppRoutes.loginScreen);
                            },
                            label: const CustomTextWidget(
                              StringConstants.splashBtnTxt2,
                              color: ColorConstants.whiteColor,
                              fontSize: 10.5,
                              fontWeight: FontWeight.w600,
                            ),
                            icon: const Icon(
                              Icons.arrow_right_alt,
                              color: ColorConstants.whiteColor,
                            ),
                            iconAlignment: IconAlignment.end,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
