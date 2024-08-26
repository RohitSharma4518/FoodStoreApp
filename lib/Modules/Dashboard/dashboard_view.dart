import 'package:flutter/material.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:foodstore/Utils/Constants/asset_constant.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/Constants/string_constant.dart';
import 'package:foodstore/Utils/Widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

const List<String> list = <String>['Your Location', 'Two', 'Three', 'Four'];

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});
  @override
  State<StatefulWidget> createState() {
    return _DashboardViewState();
  }
}

class _DashboardViewState extends State<DashboardView> {
  String dropdownValue = 'Your Location';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(22.h),
        child: AppBar(
          flexibleSpace: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AssetConstant.dashboardImg),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 6.w, bottom: 2.3.h),
                child: SizedBox(
                  width: 60.w,
                  child: const CustomTextWidget(
                    StringConstants.dashboardHeadTxt,
                    textAlign: TextAlign.start,
                    color: ColorConstants.whiteColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          leading: Column(
            children: [
              SizedBox(
                height: 2.2.h,
                width: 28.w,
                child: DropdownButton(
                  value: dropdownValue,
                  underline: const SizedBox(),
                  icon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: ColorConstants.whiteColor,
                  ),
                  iconSize: 24,
                  dropdownColor: const Color.fromARGB(150, 0, 0, 0),
                  style: const TextStyle(
                      color: ColorConstants.whiteColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Your Location', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        alignment: Alignment.bottomLeft,
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: ColorConstants.whiteColor,
                    size: 24,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  const CustomTextWidget(
                    StringConstants.dashboardLocationTxt,
                    color: ColorConstants.whiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 10.5,
                  ),
                ],
              ),
            ],
          ),
          leadingWidth: 40.w,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 4.5.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: ColorConstants.whiteColor, width: 1),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                iconSize: 24,
                icon: const Icon(
                  Icons.search,
                  color: ColorConstants.whiteColor,
                ),
                onPressed: () {
                  Get.toNamed(AppRoutes.searchScreen);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 24),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: ColorConstants.whiteColor, width: 1),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                iconSize: 24,
                icon: const Icon(
                  Icons.notifications_none_sharp,
                  color: ColorConstants.whiteColor,
                ),
                onPressed: () {},
              ),
            ),
          ],
          toolbarHeight: 6.h,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: 5.8.w, right: 5.8.w, top: 2.8.h, bottom: 2.h),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  StringConstants.dashboardCategoryTxt1,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                ),
                CustomTextWidget(
                  StringConstants.dashboardCategoryTxt2,
                  color: ColorConstants.primaryColor,
                  fontSize: 10.5,
                ),
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Container(
                margin: EdgeInsets.only(left: 5.8.w, right: 5.8.w),
                child: Column(
                  children: [
                    TabBar(
                      tabAlignment: TabAlignment.fill,
                      splashFactory: NoSplash.splashFactory,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorConstants.primaryColor,
                      ),
                      indicatorPadding:
                          const EdgeInsets.only(left: 12, right: 12),
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelStyle: const TextStyle(
                          color: ColorConstants.dividerColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      labelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.whiteColor),
                      dividerColor: Colors.transparent,
                      tabs: [
                        SizedBox(
                          height: 65,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetConstant.burgerImg,
                              ),
                              const SizedBox(
                                height: 5.5,
                              ),
                              const CustomTextWidget(
                                StringConstants.dashboardCategory1,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetConstant.tacoImg,
                            ),
                            const SizedBox(
                              height: 5.5,
                            ),
                            const CustomTextWidget(
                              StringConstants.dashboardCategory2,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              AssetConstant.drinkImg,
                            ),
                            const SizedBox(
                              height: 5.5,
                            ),
                            const CustomTextWidget(
                              StringConstants.dashboardCategory3,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              AssetConstant.pizzaImg,
                            ),
                            const SizedBox(
                              height: 5.5,
                            ),
                            const CustomTextWidget(
                              StringConstants.dashboardCategory4,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 16, bottom: 16),
                        child: TabBarView(
                          children: [
                            Center(child: content()),
                            Center(child: content()),
                            Center(child: content()),
                            Center(child: content()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget content() {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 1.8.h,
      crossAxisSpacing: 5.w,
      childAspectRatio: 0.78,
    ),
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];
      return GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.menuDetailScreen);
        },
        child: Container(
          padding: const EdgeInsetsDirectional.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorConstants.whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Image(
                    fit: BoxFit.contain,
                    width: double.infinity,
                    image: AssetImage(
                      item['photo']!,
                    ),
                  ),
                  Container(
                    width: 7.2.w,
                    height: 3.4.h,
                    margin: const EdgeInsets.only(right: 8, top: 8),
                    decoration: BoxDecoration(
                      color: ColorConstants.whiteColor,
                      border: Border.all(width: 0),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: const EdgeInsets.all(0.1),
                      iconSize: 20,
                      icon: const Icon(
                        Icons.favorite_outline_outlined,
                        color: ColorConstants.addFavouriteColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.9.h,
              ),
              CustomTextWidget(
                item['title']!,
                fontSize: 11.5,
                fontWeight: FontWeight.w500,
                color: ColorConstants.blackColor,
              ),
              Row(
                children: [
                  const Icon(Icons.star,
                      color: ColorConstants.primaryColor, size: 16),
                  SizedBox(
                    width: 1.1.w,
                  ),
                  CustomTextWidget(
                    item['rating']!,
                    fontSize: 10.2,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  const Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: ColorConstants.primaryColor,
                  ),
                  CustomTextWidget(
                    item['distance']!,
                    fontSize: 10.2,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(
                height: 0.6.h,
              ),
              Row(
                children: [
                  Text(
                    item['price']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorConstants.primaryColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

List<Map<String, String>> items = [
  {
    'photo': AssetConstant.food1Img,
    'title': 'Ordinary Burgers',
    'rating': '4.9',
    'distance': '190m',
    'price': '\$ 17,230'
  },
  {
    'photo': AssetConstant.food2Img,
    'title': 'Burger With Meat',
    'rating': '4.9',
    'distance': '190m',
    'price': '\$ 17,230'
  },
  {
    'photo': AssetConstant.food3Img,
    'title': 'Burger Veggi',
    'rating': '4.9',
    'distance': '190m',
    'price': '\$ 17,230'
  },
  {
    'photo': AssetConstant.food4Img,
    'title': 'Burger jambo',
    'rating': '4.9',
    'distance': '190m',
    'price': '\$ 17,230'
  },
  {
    'photo': AssetConstant.food1Img,
    'title': 'Ordinary Burgers',
    'rating': '4.9',
    'distance': '190m',
    'price': '\$ 17,230'
  },
  {
    'photo': AssetConstant.food3Img,
    'title': 'Burger With Meat',
    'rating': '4.9',
    'distance': '190m',
    'price': '\$ 17,230'
  },
];
