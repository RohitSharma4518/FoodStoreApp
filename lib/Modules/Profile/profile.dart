import 'package:flutter/material.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:foodstore/Utils/Constants/asset_constant.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/Constants/string_constant.dart';
import 'package:foodstore/Utils/Constants/widget_constant.dart';
import 'package:foodstore/Utils/Widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    var gender;
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
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
        title: const CustomTextWidget(
          StringConstants.profileAppBarTxt,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: const Icon(
                Icons.settings_outlined,
                color: ColorConstants.blackColor,
                size: 24,
              ),
              onPressed: () {
                Get.toNamed(
                  AppRoutes.settingScreen,
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 6.w, right: 6.w, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: Image.asset(AssetConstant.profileAccntImg),
              ),
              SizedBox(
                height: 3.4.h,
              ),
              const CustomTextWidget(
                StringConstants.profileLabel1Txt,
                color: ColorConstants.blackColor,
                fontSize: 10.5,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 1.h,
              ),
              const CustomTextField(
                hint: StringConstants.profileLabel1Txt,
              ),
              SizedBox(
                height: 1.4.h,
              ),
              const Text(
                StringConstants.profileLabel2Txt,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: ColorConstants.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              const CustomTextField(
                hint: StringConstants.profileLabel2Txt,
              ),
              SizedBox(
                height: 1.4.h,
              ),
              const Text(
                StringConstants.profileLabel3Txt,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: ColorConstants.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              InputDecorator(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: gender,
                    isDense: true,
                    isExpanded: true,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 28,
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: "",
                        child: Text("Select Gender"),
                      ),
                      DropdownMenuItem(
                        value: "Male",
                        child: Text("Male"),
                      ),
                      DropdownMenuItem(
                        value: "Female",
                        child: Text("Female"),
                      ),
                    ],
                    onChanged: (newValue) {
                      setState(() {});
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 1.4.h,
              ),
              const Text(
                StringConstants.profileLabel4Txt,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: ColorConstants.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              const CustomTextField(
                hint: StringConstants.profileLabel4Txt,
                inputType: TextInputType.number,
              ),
              SizedBox(
                height: 1.4.h,
              ),
              const Text(
                StringConstants.profileLabel5Txt,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: ColorConstants.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              const CustomTextField(
                hint: StringConstants.profileLabel5Txt,
              ),
              SizedBox(
                height: 4.h,
              ),
              ThemeBtn(
                btnName: 'Save',
                btnAction: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
