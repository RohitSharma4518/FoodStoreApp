import 'package:flutter/material.dart';
import 'package:foodstore/Modules/MenuDetail/menu_detail_controller.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/Constants/string_constant.dart';
import 'package:foodstore/Utils/Widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

const List<String> list = <String>['Your Location', 'Two', 'Three', 'Four'];

class MenuDetailView extends StatefulWidget {
  const MenuDetailView({super.key});
  @override
  State<MenuDetailView> createState() {
    return _MenuDetailViewState();
  }
}

int _activePage = 0;

late List<Widget> _pages;

class _MenuDetailViewState extends State<MenuDetailView> {
  @override
  void initState() {
    super.initState();
    _activePage = 0;
  }

  @override
  Widget build(BuildContext context) {
    final MenuDetailController menuDetailController =
        Get.find<MenuDetailController>();
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: Obx(
        () {
          final foodItem = menuDetailController.selectedFoodItem.value;

          List<String?> imagePath = <String>[
            (foodItem!.img),
            (foodItem.img),
            (foodItem.img),
          ];

          _pages = List.generate(
            imagePath.length,
            (index) => ImagePlaceHolder(
              imagePath: imagePath[index],
            ),
          );

          // ignore: unnecessary_null_comparison
          if (foodItem == null) {
            return const Center(
              child: Text('No item Selected'),
            );
          }
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 8, top: 8, right: 8),
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: ColorConstants.whiteColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            PageView.builder(
                              itemCount: imagePath.length,
                              onPageChanged: (value) {
                                setState(() {
                                  _activePage = value;
                                });
                              },
                              itemBuilder: (context, index) {
                                return _pages[index];
                              },
                            ),
                            // Code for Page Indicator
                            Container(
                              color: Colors.transparent,
                              margin: EdgeInsets.only(bottom: 4.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List<Widget>.generate(
                                  _pages.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Container(
                                      height: 0.4.h,
                                      width: 8.w,
                                      decoration: BoxDecoration(
                                        color: _activePage == index
                                            ? ColorConstants.primaryColor
                                            : ColorConstants.whiteColor,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //App Bar Code
                      Container(
                        margin: EdgeInsets.only(top: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 4.2.h,
                              width: 9.5.w,
                              margin: EdgeInsets.only(left: 6.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                padding: const EdgeInsets.all(1),
                                iconSize: 16,
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_sharp,
                                  color: Colors.white,
                                ),
                                onPressed: () => Get.back(),
                              ),
                            ),
                            const CustomTextWidget(
                              StringConstants.detailHeadTxt,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: ColorConstants.whiteColor,
                            ),
                            Container(
                              height: 4.2.h,
                              width: 9.5.w,
                              margin: EdgeInsets.only(right: 6.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                padding: const EdgeInsets.all(1),
                                iconSize: 20,
                                icon: const Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 52.h,
                decoration: const BoxDecoration(
                    color: ColorConstants.whiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Container(
                  margin: EdgeInsets.only(
                      left: 6.w, right: 6.w, top: 1.8.h, bottom: 3.6.h),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          foodItem.name,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 0.9.h,
                        ),
                        CustomTextWidget(
                          '\$ ${menuDetailController.formatPrice(foodItem.price)}',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: ColorConstants.primaryColor,
                        ),
                        SizedBox(
                          height: 1.8.h,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: ColorConstants.cartDetailColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Row 1
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.attach_money,
                                    size: 20,
                                    color: ColorConstants.primaryColor,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  const CustomTextWidget(
                                    StringConstants.detailFreeDeliveryTxt,
                                    color: ColorConstants.dividerColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ],
                              ),
                              //Row 2
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.access_time_filled_outlined,
                                    size: 18,
                                    color: ColorConstants.primaryColor,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  const CustomTextWidget(
                                    StringConstants.detailTimeTxt,
                                    color: ColorConstants.dividerColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ],
                              ),
                              // Row 3
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 20,
                                    color: ColorConstants.primaryColor,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  const CustomTextWidget(
                                    StringConstants.detailRatingTxt,
                                    color: ColorConstants.dividerColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.8.h,
                        ),
                        const CustomTextWidget(
                          StringConstants.detailFdDescriptionTxt,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          width: 75.w,
                          child: CustomTextWidget(
                            foodItem.description,
                            textAlign: TextAlign.left,
                            color: ColorConstants.dividerColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                          ),
                        ),
                        SizedBox(
                          height: 2.4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () =>
                                      menuDetailController.decrement(),
                                  icon: const Icon(Icons.remove),
                                  iconSize: 28,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                CustomTextWidget(
                                  '${menuDetailController.counter.value}',
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                IconButton(
                                  onPressed: () =>
                                      menuDetailController.increment(),
                                  icon: const Icon(Icons.add),
                                  iconSize: 28,
                                ),
                              ],
                            ),
                            CustomTextWidget(
                              "\$ ${menuDetailController.formatPrice(menuDetailController.totalPrice.value)}",
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: ColorConstants.primaryColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.8.h,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton.icon(
                            onPressed: () {},
                            label: const CustomTextWidget(
                              StringConstants.detailFdBtnTxt,
                              fontWeight: FontWeight.w500,
                              fontSize: 10.5,
                            ),
                            icon: const Icon(
                              Icons.shopping_cart_outlined,
                              size: 20,
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: ColorConstants.primaryColor,
                              foregroundColor: ColorConstants.whiteColor,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({super.key, this.imagePath});

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath!,
      fit: BoxFit.fill,
    );
  }
}
