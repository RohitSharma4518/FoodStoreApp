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
        backgroundColor: ColorConstants.cartPageBgColor,
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
                Icons.logout,
                color: ColorConstants.blackColor,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 16,
          bottom: 60,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              StringConstants.settingProfileTxt,
              style: TextStyle(
                color: ColorConstants.dividerColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
            ),

            //Push Notification

            Container(
              margin: const EdgeInsets.only(
                left: 0,
                top: 8,
                bottom: 8,
                right: 0,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstants.settingPushNotifyTxt,
                    style: TextStyle(
                      color: ColorConstants.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // CustomSwitch(
                  //   value: _enable,
                  //   onChanged: (bool val) {
                  //     setState(() {
                  //       _enable = val;
                  //     });
                  //   },
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),

            //Location

            Container(
              margin: const EdgeInsets.only(
                left: 0,
                top: 8,
                bottom: 8,
                right: 0,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstants.settingLocationTxt,
                    style: TextStyle(
                      color: ColorConstants.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // CustomSwitch(
                  //   value: _enable1,
                  //   onChanged: (bool val) {
                  //     setState(() {
                  //       _enable1 = val;
                  //     });
                  //   },
                  // ),
                ],
              ),
            ),

            const SizedBox(
              height: 8,
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

            const SizedBox(
              height: 18,
            ),

            const Text(
              StringConstants.settingOtherTxt,
              style: TextStyle(
                color: ColorConstants.dividerColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(
              height: 8,
            ),

            //About Ticket

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  StringConstants.settingTicketTxt,
                  style: TextStyle(
                    color: ColorConstants.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
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
            Container(
              color: ColorConstants.whiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    StringConstants.settingPrivacyTxt,
                    style: TextStyle(
                      color: ColorConstants.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                    iconSize: 20,
                    color: ColorConstants.blackColor,
                  )
                ],
              ),
            ),

            // term and condition policy
            Container(
              color: ColorConstants.whiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    StringConstants.settingTcTxt,
                    style: TextStyle(
                      color: ColorConstants.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                    iconSize: 20,
                    color: ColorConstants.blackColor,
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 40,
            ),
            ThemeBtn(
              btnName: 'Sign Out',
              btnAction: () {
                _showLogoutDialog(context);
              },
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 70),
                child: Text(
                  StringConstants.settingSignOutTxt,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                width: 61,
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
          content: const Text(
            StringConstants.settingSignOutAlertTxt,
            style: TextStyle(
              color: ColorConstants.dividerColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 48,
                  width: 130.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorConstants.dividerColor),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.whiteColor,
                    ),
                    child: const Text(
                      StringConstants.settingCancelBtnTxt,
                      style: TextStyle(
                        color: ColorConstants.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  height: 48,
                  width: 130.5,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.primaryColor),
                    child: const Text(
                      StringConstants.settingLogoutBtnTxt,
                      style: TextStyle(
                        color: ColorConstants.whiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
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
