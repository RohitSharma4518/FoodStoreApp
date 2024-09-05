// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:foodstore/Modules/Dashboard/dashboard_controller.dart';
import 'package:foodstore/Utils/Constants/string_constant.dart';
import 'package:foodstore/Utils/Constants/widget_constant.dart';
import 'package:foodstore/Utils/Widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:sizer/sizer.dart';
import 'package:foodstore/Routes/app_routes.dart'; // Import route constants

class CategoryProductsPage extends StatelessWidget {
  final String categoryId;
  final DashboardController dashboardController =
      Get.find<DashboardController>();

  CategoryProductsPage({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    dashboardController.fetchFoodItemsByCategory(categoryId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        leading: Container(
          margin: EdgeInsets.only(left: 5.6.w),
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
        leadingWidth: 14.5.w,
        toolbarHeight: 7.h,
        title: const CustomTextWidget(
          StringConstants.seeCatProductsTxt,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (dashboardController.foodItems.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
            padding: EdgeInsets.all(3.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2.h,
              crossAxisSpacing: 4.w,
              childAspectRatio: 0.71,
            ),
            itemCount: dashboardController.foodItems.length,
            itemBuilder: (context, index) {
              final item = dashboardController.foodItems[index];
              return Container(
                padding: const EdgeInsetsDirectional.only(
                    top: 8, start: 12, bottom: 8, end: 12),
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
                        Center(
                          widthFactor: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.00),
                            child: Image(
                              fit: BoxFit.contain,
                              width: 35.w,
                              height: 9.h,
                              image: NetworkImage(item.img),
                            ),
                          ),
                        ),
                        Container(
                          width: 7.5.w,
                          height: 4.h,
                          margin: const EdgeInsets.only(right: 8, top: 8),
                          decoration: BoxDecoration(
                            color: ColorConstants.whiteColor,
                            border: Border.all(width: 0),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.all(0.1),
                            iconSize: 5.w,
                            icon: const Icon(
                              Icons.favorite_outline_outlined,
                              color: ColorConstants.appBarColor,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    CustomTextWidget(
                      item.name,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                      color: ColorConstants.blackColor,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: ColorConstants.primaryColor,
                          size: 4.w,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        CustomTextWidget(
                          item.rating,
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.blackColor,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.location_on_outlined,
                          size: 4.w,
                          color: ColorConstants.primaryColor,
                        ),
                        CustomTextWidget(
                          item.distance,
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.blackColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.6.h,
                    ),
                    Row(
                      children: [
                        CustomTextWidget(
                          '\$ ${item.price}',
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: ColorConstants.primaryColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100.w,
                      child: ThemeBtn(
                        btnName: StringConstants.seeCatProductsAddCartTxt,
                        btnAction: () => Get.toNamed(AppRoutes.emptyCartScreen),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
