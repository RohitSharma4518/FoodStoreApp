import 'package:flutter/material.dart';
import 'package:foodstore/Utils/Constants/asset_constant.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/Constants/string_constant.dart';
import 'package:foodstore/Utils/Widgets/custom_text_widget.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sizer/sizer.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: 8.h,
          left: 6.3.w,
          right: 6.3.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 60.w,
                child: const CustomTextWidget(
                  StringConstants.searchHeadTxt,
                  textAlign: TextAlign.left,
                  color: ColorConstants.blackColor,
                  fontSize: 26.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 2.1.h,
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon:
                    const Icon(Icons.search, color: ColorConstants.blackColor),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Bootstrap.sliders2_vertical,
                    color: ColorConstants.blackColor,
                  ),
                ),
                hintText: StringConstants.searchTxtFieldHintTxt,
                hintStyle: const TextStyle(
                  color: ColorConstants.dividerColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: ColorConstants.authOptionColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: ColorConstants.dividerColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Image.asset(AssetConstant.searchPageImg),
            SizedBox(
              height: 2.h,
            ),
            const CustomTextWidget(
              StringConstants.searchNoItemTxt,
              color: ColorConstants.blackColor,
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 1.h,
            ),
            const SizedBox(
              width: 282,
              child: CustomTextWidget(
                textAlign: TextAlign.center,
                StringConstants.searchNoItemTypeErrorTxt,
                color: ColorConstants.dividerColor,
                fontSize: 10.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
