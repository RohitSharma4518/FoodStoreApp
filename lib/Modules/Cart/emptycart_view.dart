import 'package:flutter/material.dart';
import 'package:foodstore/Utils/Constants/asset_constant.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/Constants/string_constant.dart';
import 'package:foodstore/Utils/Constants/widget_constant.dart';
import 'package:foodstore/Utils/Widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EmptyCartView extends StatefulWidget {
  const EmptyCartView({super.key});

  @override
  State<EmptyCartView> createState() => _EmptyCartViewState();
}

class _EmptyCartViewState extends State<EmptyCartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        leading: Container(
          margin: EdgeInsets.only(left: 5.5.w),
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
        leadingWidth: 15.w,
        toolbarHeight: 7.h,
        title: const CustomTextWidget(
          StringConstants.emptyCartAppBarText,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        actions: [
          Container(
            height: 5.h,
            width: 9.5.w,
            margin: const EdgeInsets.only(right: 24),
            decoration: BoxDecoration(
              border: Border.all(color: ColorConstants.appBarColor, width: 1),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: const EdgeInsets.all(1),
              iconSize: 24,
              icon: const Icon(
                Icons.more_horiz_rounded,
                color: ColorConstants.blackColor,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: 5.8.w,
          right: 5.8.w,
          top: 6.4.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AssetConstant.emptyCartImg),
            SizedBox(
              height: 6.4.h,
            ),
            const CustomTextWidget(
              StringConstants.emptyCartHeaderText,
              color: ColorConstants.blackColor,
              fontSize: 18.5,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              width: 60.w,
              child: const CustomTextWidget(
                textAlign: TextAlign.center,
                StringConstants.emptyCartSubText,
                color: ColorConstants.dividerColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 4.6.h,
            ),
            ThemeBtn(
              btnName: 'Find Foods',
              btnAction: () {},
            ),
          ],
        ),
      ),
    );
  }
}
