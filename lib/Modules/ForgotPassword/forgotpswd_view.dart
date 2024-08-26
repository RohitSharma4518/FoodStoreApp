import 'package:flutter/material.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/Constants/string_constant.dart';
import 'package:foodstore/Utils/Constants/widget_constant.dart';
import 'package:foodstore/Utils/Widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

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
          margin: EdgeInsets.only(
              top: 8.8.h, bottom: 16.h, left: 5.8.w, right: 5.8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextWidget(
                StringConstants.forgotpassHeadTxt,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 0.9.h,
              ),
              const CustomTextWidget(
                StringConstants.forgotpassSubHeadTxt,
                textAlign: TextAlign.left,
                color: ColorConstants.dividerColor,
                fontWeight: FontWeight.w500,
                fontSize: 10.5,
              ),
              SizedBox(
                height: 3.6.h,
              ),
              const CustomTextWidget(
                StringConstants.forgotpassEmailTxt,
                fontSize: 10.3,
              ),
              SizedBox(
                height: 0.9.h,
              ),
              // const CustomTextField(
              //   hint: "Enter Email",
              // ),
              SizedBox(
                height: 18.h,
              ),
              ThemeBtn(
                btnName: StringConstants.forgotpassBtnTxt,
                btnAction: () => Get.toNamed(AppRoutes.resetPswdScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
