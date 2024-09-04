import 'package:flutter/material.dart';
import 'package:foodstore/Modules/Dashboard/dashboard_controller.dart';
import 'package:foodstore/Modules/SeeAllSection/category_products.dart';
import 'package:foodstore/Utils/Constants/string_constant.dart';
import 'package:foodstore/Utils/Widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:sizer/sizer.dart';

class SeeAllCategoriesPage extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  SeeAllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          StringConstants.seeAllCatTxt,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (homeController.tabBarItems.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2.h,
              crossAxisSpacing: 4.w,
              childAspectRatio: 0.8,
            ),
            itemCount: homeController.tabBarItems.length,
            itemBuilder: (context, index) {
              final category = homeController.tabBarItems[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => CategoryProductsPage(categoryId: category.id));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorConstants.cartDetailColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        category.img,
                        height: 11.h,
                        width: 100,
                      ),
                      SizedBox(height: 1.h),
                      CustomTextWidget(
                        category.title,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorConstants.blackColor,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
