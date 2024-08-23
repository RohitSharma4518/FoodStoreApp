import 'package:flutter/material.dart';
import 'package:foodstore/Modules/Cart/cart_controller.dart';
import 'package:foodstore/Utils/Constants/asset_constant.dart';
import 'package:foodstore/Utils/Constants/color_constant.dart';
import 'package:foodstore/Utils/Constants/string_constant.dart';
import 'package:foodstore/Utils/Constants/widget_constant.dart';
import 'package:foodstore/Utils/Widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();

    return Scaffold(
      backgroundColor: ColorConstants.cartPageBgColor,
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
                Icons.more_horiz_rounded,
                color: ColorConstants.blackColor,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Obx(
        () => Container(
          margin: EdgeInsets.only(
            left: 5.8.w,
            right: 5.8.w,
            top: 1.8.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextWidget(
                          StringConstants.cartLocationTxt1,
                          color: ColorConstants.dividerColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 0.6.h,
                        ),
                        const CustomTextWidget(
                          StringConstants.cartLocationTxt2,
                          color: ColorConstants.blackColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 3.5.h,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          side: const BorderSide(
                            color: ColorConstants.primaryColor,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const CustomTextWidget(
                          StringConstants.cartLocationBtnTxt,
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.6.h,
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(AssetConstant.discountImg),
                    suffixIcon: Container(
                      margin: EdgeInsets.only(
                          top: 0.9.h, bottom: 0.9.h, right: 3.w),
                      child: SizedBox(
                        width: 21.w,
                        height: 4.h,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: ColorConstants.primaryColor,
                            foregroundColor: ColorConstants.whiteColor,
                          ),
                          child: const CustomTextWidget(
                            StringConstants.cartPromoBtnTxt,
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            color: ColorConstants.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    hintText: StringConstants.cartPromoCodeTxt,
                    hintStyle: const TextStyle(
                      color: ColorConstants.cartPromoTxtColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(
                        color: ColorConstants.appBarColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(
                        color: ColorConstants.dividerColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.6.h,
                ),

                //Cart 1
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorConstants.whiteColor,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Checkbox.adaptive(
                          value: cartController.chkFood.value,
                          onChanged: (bool? val) {
                            cartController.chkFood.value =
                                !cartController.chkFood.value;
                          },
                          activeColor: ColorConstants.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Image.asset(
                        AssetConstant.cartBurger1Img,
                        fit: BoxFit.fitHeight,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            StringConstants.cartBurger1NameTxt,
                            style: TextStyle(
                              color: ColorConstants.blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 0.4.h,
                          ),
                          const Text(
                            StringConstants.cartBurger1PriceTxt,
                            style: TextStyle(
                              color: ColorConstants.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 0.8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstants.appBarColor,
                                      width: 1),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  padding: const EdgeInsets.all(1),
                                  iconSize: 22,
                                  icon: const Icon(
                                    Icons.remove,
                                    color: ColorConstants.dividerColor,
                                  ),
                                  onPressed: () => {
                                    cartController.foodQuantity1.value == 1
                                        ? cartController.foodQuantity1.value
                                        : cartController.foodQuantity1.value--
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              CustomTextWidget(
                                '${cartController.foodQuantity1.value}',
                                color: ColorConstants.blackColor,
                                fontSize: 11.5,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                width: 3.8.w,
                              ),
                              Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstants.appBarColor,
                                      width: 1),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  padding: const EdgeInsets.all(1),
                                  iconSize: 22,
                                  icon: const Icon(
                                    Icons.add,
                                    color: ColorConstants.blackColor,
                                  ),
                                  onPressed: () =>
                                      {cartController.foodQuantity1.value++},
                                ),
                              ),
                              SizedBox(
                                width: 13.w,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  AssetConstant.cartDeleteIconImg,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.2.h,
                ),

                //Cart 2
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorConstants.whiteColor,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Checkbox.adaptive(
                          value: cartController.chkFood2.value,
                          onChanged: (bool? val) {
                            cartController.chkFood2.value =
                                !cartController.chkFood2.value;
                          },
                          activeColor: ColorConstants.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Image.asset(
                        AssetConstant.cartBurger2Img,
                        fit: BoxFit.fitHeight,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            StringConstants.cartBurger2NameTxt,
                            style: TextStyle(
                              color: ColorConstants.blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 0.4.h,
                          ),
                          const Text(
                            StringConstants.cartBurger2PriceTxt,
                            style: TextStyle(
                              color: ColorConstants.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 0.8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstants.appBarColor,
                                      width: 1),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  padding: const EdgeInsets.all(1),
                                  iconSize: 22,
                                  icon: const Icon(
                                    Icons.remove,
                                    color: ColorConstants.dividerColor,
                                  ),
                                  onPressed: () => {
                                    cartController.foodQuantity2.value == 1
                                        ? cartController.foodQuantity2.value
                                        : cartController.foodQuantity2.value--
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              CustomTextWidget(
                                '${cartController.foodQuantity2.value}',
                                color: ColorConstants.blackColor,
                                fontSize: 11.5,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                width: 3.8.w,
                              ),
                              Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstants.appBarColor,
                                      width: 1),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  padding: const EdgeInsets.all(1),
                                  iconSize: 22,
                                  icon: const Icon(
                                    Icons.add,
                                    color: ColorConstants.blackColor,
                                  ),
                                  onPressed: () =>
                                      {cartController.foodQuantity2.value++},
                                ),
                              ),
                              SizedBox(
                                width: 13.w,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  AssetConstant.cartDeleteIconImg,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.8.h,
                ),

                // Payment Summary cart
                Container(
                  padding: const EdgeInsets.all(
                    12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: ColorConstants.appBarColor,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextWidget(
                        StringConstants.cartPaymentTxt1,
                        color: ColorConstants.blackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 0.9.h,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                            StringConstants.cartTotalPaymentTxt1,
                            color: ColorConstants.dividerColor,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomTextWidget(
                            StringConstants.cartTotalPaymentTxt2,
                            color: ColorConstants.blackColor,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.8.h,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                            StringConstants.cartPaymentDeliveryTxt1,
                            color: ColorConstants.dividerColor,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomTextWidget(
                            StringConstants.cartPaymentDeliveryTxt2,
                            color: ColorConstants.blackColor,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.8.h,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                            StringConstants.cartPaymentDiscountTxt1,
                            color: ColorConstants.dividerColor,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomTextWidget(
                            StringConstants.cartPaymentDiscountTxt2,
                            color: ColorConstants.primaryColor,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.8.h,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                            StringConstants.cartPaymentFinalTxt1,
                            color: ColorConstants.dividerColor,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomTextWidget(
                            StringConstants.cartPaymentFinalTxt2,
                            color: ColorConstants.blackColor,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 2.8.h,
                ),

                ThemeBtn(
                  btnName: 'Order Now',
                  btnAction: () {},
                ),
                SizedBox(
                  height: 4.8.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
