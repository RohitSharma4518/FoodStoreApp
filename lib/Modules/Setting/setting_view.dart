import 'package:flutter/material.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/Constants/string_constant.dart';
import 'package:foodstore/Utils/Constants/widget_constant.dart';
import 'package:foodstore/Utils/Widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  bool _enable = true;
  bool _enable1 = false;

  String languageDropdown = "English";

  var langList = [
    "English",
    "Hindi",
    "Marathi",
  ];

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
          StringConstants.settingHeadTxt,
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
                Icons.logout,
                color: ColorConstants.blackColor,
              ),
              onPressed: () {
                _showLogoutDialog(context);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 5.6.w,
          right: 5.6.w,
          top: 16,
          bottom: 60,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(
              StringConstants.settingProfileTxt,
              color: ColorConstants.dividerColor,
              fontSize: 8.5,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 1.h,
            ),

            //Push Notification
            Container(
              margin: const EdgeInsets.only(
                top: 8,
                bottom: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextWidget(
                    StringConstants.settingPushNotifyTxt,
                    color: ColorConstants.blackColor,
                    fontSize: 10.5,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomSwitch(
                    value: _enable,
                    onChanged: (bool val) {
                      setState(() {
                        _enable = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),

            //Location
            Container(
              margin: const EdgeInsets.only(
                top: 8,
                bottom: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextWidget(
                    StringConstants.settingLocationTxt,
                    color: ColorConstants.blackColor,
                    fontSize: 10.5,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomSwitch(
                    value: _enable1,
                    onChanged: (bool val) {
                      setState(
                        () {
                          _enable1 = val;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 1.h,
            ),

            //Language
            Container(
              margin: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    StringConstants.settingLanguageTxt,
                    style: TextStyle(
                      color: ColorConstants.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          isExpanded: true,
                          iconSize: 20,
                          value: languageDropdown,
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: ColorConstants.blackColor,
                          ),
                          items: langList.map((String langList) {
                            return DropdownMenuItem(
                              value: langList,
                              child: Text(
                                langList,
                                style: const TextStyle(
                                  color: ColorConstants.blackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              languageDropdown = newValue!;
                            });
                          }),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 2.h,
            ),

            const CustomTextWidget(
              StringConstants.settingOtherTxt,
              color: ColorConstants.dividerColor,
              fontSize: 8.6,
              fontWeight: FontWeight.w500,
            ),

            SizedBox(
              height: 1.h,
            ),

            //About Ticket
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTextWidget(
                  StringConstants.settingTicketTxt,
                  color: ColorConstants.blackColor,
                  fontSize: 10.5,
                  fontWeight: FontWeight.w500,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                  iconSize: 20,
                  color: ColorConstants.blackColor,
                )
              ],
            ),

            // privacy policy
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTextWidget(
                  StringConstants.settingPrivacyTxt,
                  color: ColorConstants.blackColor,
                  fontSize: 10.5,
                  fontWeight: FontWeight.w500,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                  iconSize: 20,
                  color: ColorConstants.blackColor,
                )
              ],
            ),

            // term and condition policy
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTextWidget(
                  StringConstants.settingTcTxt,
                  color: ColorConstants.blackColor,
                  fontSize: 10.5,
                  fontWeight: FontWeight.w500,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                  iconSize: 20,
                  color: ColorConstants.blackColor,
                )
              ],
            ),

            SizedBox(
              height: 4.4.h,
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const CustomTextWidget(
                StringConstants.settingSignOutTxt,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                width: 13.w,
              ),
              IconButton(
                onPressed: () {
                  Get.close(1);
                },
                icon: const Icon(
                  Icons.close,
                ),
                iconSize: 30,
                color: ColorConstants.blackColor,
              ),
            ],
          ),
          content: const CustomTextWidget(
            StringConstants.settingSignOutAlertTxt,
            color: ColorConstants.dividerColor,
            fontSize: 10.5,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 5.8.h,
                  width: 30.w,
                  child: TextButton(
                    onPressed: () {
                      Get.close(1);
                    },
                    style: TextButton.styleFrom(
                      side: const BorderSide(
                        color: ColorConstants.signputBtnColor,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const CustomTextWidget(
                      StringConstants.settingCancelBtn,
                      fontSize: 10.5,
                      fontWeight: FontWeight.w600,
                      color: ColorConstants.blackColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                SizedBox(
                  height: 5.8.h,
                  width: 30.w,
                  child: ThemeBtn(
                    btnName: 'Log Out',
                    btnAction: () {
                      Get.toNamed(AppRoutes.loginScreen);
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
