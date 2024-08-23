import 'package:flutter/material.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:foodstore/Utils/Constants/asset_constant.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
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
                    'Provide the best food for you',
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
                  elevation: 0,
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
              const SizedBox(
                height: 9,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: ColorConstants.whiteColor,
                    size: 24,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'New York City',
                    style: TextStyle(
                        color: ColorConstants.whiteColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          leadingWidth: 152,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16),
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
          toolbarHeight: 53,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 16),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Find by Category',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    color: ColorConstants.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Container(
                margin: const EdgeInsets.only(left: 24, right: 24),
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
                              const Text(
                                'Burger',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
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
                            const Text(
                              'Taco',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
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
                            const Text(
                              'Drink',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
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
                            const Text(
                              'Pizza',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
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
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 22,
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
                    width: 30,
                    height: 30,
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
              const SizedBox(
                height: 8,
              ),
              Text(
                item['title']!,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.blackColor),
              ),
              Row(
                children: [
                  const Icon(Icons.star,
                      color: ColorConstants.primaryColor, size: 16),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    item['rating']!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: ColorConstants.primaryColor,
                  ),
                  Text(
                    item['distance']!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Text(
                    item['price']!,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorConstants.primaryColor),
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
