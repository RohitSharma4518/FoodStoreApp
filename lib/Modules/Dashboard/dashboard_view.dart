import 'package:flutter/material.dart';
import 'package:foodstore/Modules/Dashboard/Model/dashboard_model.dart';
import 'package:foodstore/Modules/Dashboard/dashboard_controller.dart';
import 'package:foodstore/Modules/MenuDetail/menu_detail_controller.dart';
import 'package:foodstore/Routes/app_routes.dart';
import 'package:foodstore/Utils/Constants/asset_constant.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/Constants/string_constant.dart';
import 'package:foodstore/Utils/Widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});
  @override
  State<StatefulWidget> createState() {
    return _DashboardViewState();
  }
}

class _DashboardViewState extends State<DashboardView> {
  final DashboardController controller = Get.put(DashboardController());
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
                height: 2.3.h,
                width: 28.w,
                child: Obx(
                  () => DropdownButton<String>(
                    value: controller.dropdownValue.value.isNotEmpty
                        ? controller.dropdownValue.value
                        : null,
                    underline: const SizedBox(),
                    icon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: ColorConstants.whiteColor,
                    ),
                    iconSize: 6.w,
                    elevation: 0,
                    dropdownColor: const Color.fromARGB(150, 0, 0, 0),
                    style: const TextStyle(
                        color: ColorConstants.whiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    items: <String>[
                      StringConstants.dashboardLocationTxt1,
                      StringConstants.dashboardLocationTxt2,
                      StringConstants.dashboardLocationTxt3,
                      StringConstants.dashboardLocationTxt4,
                    ].map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          alignment: Alignment.bottomLeft,
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (String? newValue) {
                      controller.setDropdownValue(newValue!);
                    },
                  ),
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
                  Obx(() => CustomTextWidget(
                        controller.dropdownValue.value,
                        color: ColorConstants.whiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 10.5,
                      )),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTextWidget(
                  StringConstants.dashboardCategoryTxt1,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.seeAllCategoryScreen),
                  child: const CustomTextWidget(
                    StringConstants.dashboardCategoryTxt2,
                    color: ColorConstants.primaryColor,
                    fontSize: 10.5,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () {
                if (controller.tabBarItems.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return DefaultTabController(
                  length: controller.tabBarItems.length,
                  initialIndex: controller.selectedTabIndex.value,
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
                          tabs: controller.tabBarItems.map(
                            (item) {
                              return SizedBox(
                                height: 7.4.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      item.img,
                                    ),
                                    const SizedBox(
                                      height: 5.5,
                                    ),
                                    CustomTextWidget(
                                      item.title,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ).toList(),
                          onTap: (value) {
                            controller.setSelectedTabIndex(value);
                            controller.fetchFoodItemsByCategory(
                                controller.tabBarItems[value].id);
                          },
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 16, bottom: 16),
                            child: TabBarView(
                              children: controller.tabBarItems.map(
                                (item) {
                                  return Center(
                                    child: listFoodItems(controller.foodItems
                                        .where((foodItem) =>
                                            foodItem.category_id == item.id)
                                        .toList()),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget listFoodItems(List<FoodItem> foodItems) {
  final MenuDetailController menuDetailController = Get.find();
  final DashboardController controller = Get.put(DashboardController());
  return Obx(
    () {
      if (controller.foodItems.isEmpty) {
        return const Center(
          child: Text(
            "No Items Available",
          ),
        );
      }

      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1.8.h,
          crossAxisSpacing: 5.w,
          childAspectRatio: 0.78,
        ),
        itemCount: controller.foodItems.length,
        itemBuilder: (context, index) {
          final item = controller.foodItems[index];
          return GestureDetector(
            onTap: () {
              menuDetailController.setSelectedFoodItem(item);
              Get.toNamed(AppRoutes.menuDetailScreen, arguments: item);
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image(
                          height: 11.4.h,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          image: NetworkImage(item.img),
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
                    item.name,
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
                        item.rating,
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
                        item.distance,
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
                      CustomTextWidget(
                        '\$ ${item.price.toString()}',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorConstants.primaryColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
