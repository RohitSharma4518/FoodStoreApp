import 'package:flutter/material.dart';
import 'package:foodstore/Utils/Constants/asset_constant.dart';
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

const List<String> imagePath = <String>[
  (AssetConstant.menuImg),
  (AssetConstant.menuImg),
  (AssetConstant.menuImg),
];

late List<Widget> _pages;

int _activePage = 0;

class _MenuDetailViewState extends State<MenuDetailView> {
  String dropdownValue = 'Your Location';

  @override
  void initState() {
    super.initState();
    _pages = List.generate(
      imagePath.length,
      (index) => ImagePlaceHolder(
        imagePath: imagePath[index],
      ),
    );
  }

  var counter = 1;
  var price = 12460;

  void addCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    if (counter > 1) {
      setState(() {
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
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
                            border: Border.all(color: Colors.white, width: 1),
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
                            border: Border.all(color: Colors.white, width: 1),
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
                    const CustomTextWidget(
                      StringConstants.detailFoodItemTxt,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 0.9.h,
                    ),
                    const CustomTextWidget(
                      StringConstants.detailFoodItemPriceTxt,
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
                      child: const CustomTextWidget(
                        StringConstants.detailFdDescDetailTxt,
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
                              onPressed: () => decrementCounter(),
                              icon: const Icon(Icons.remove),
                              iconSize: 28,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            CustomTextWidget(
                              counter < 0 ? '0' : '$counter',
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            IconButton(
                              onPressed: () => addCounter(),
                              icon: const Icon(Icons.add),
                              iconSize: 28,
                            ),
                          ],
                        ),
                        const CustomTextWidget(
                          StringConstants.detailFoodItemPriceTxt,
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
      ),
    );
  }
}

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({super.key, this.imagePath});

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath!,
      fit: BoxFit.fill,
    );
  }
}



//  Container(
//             width: double.infinity,
//             height: 600,
//             decoration: const BoxDecoration(
//                 color: ColorConstants.blackColor,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40),
//                     topRight: Radius.circular(40))),
//             child: Container(
//               margin: const EdgeInsets.only(
//                   left: 24, right: 24, top: 16, bottom: 32),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Burger With Meat 🍔',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   const Text(
//                     '\$ 12,230',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w600,
//                       color: ColorConstants.primaryColor,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                         color: Color.fromARGB(24, 254, 140, 0),
//                         borderRadius: BorderRadius.circular(8)),
//                     child: const Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         //Row 1
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.attach_money,
//                               size: 20,
//                               color: ColorConstants.primaryColor,
//                             ),
//                             SizedBox(
//                               width: 8,
//                             ),
//                             Text(
//                               'Free Delivery',
//                               style: TextStyle(
//                                 color: ColorConstants.dividerColor,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ],
//                         ),
//                         //Row 2
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.access_time_filled_outlined,
//                               size: 18,
//                               color: ColorConstants.primaryColor,
//                             ),
//                             SizedBox(
//                               width: 8,
//                             ),
//                             Text(
//                               '25 - 30',
//                               style: TextStyle(
//                                 color: ColorConstants.dividerColor,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ],
//                         ),
//                         // Row 3
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.star,
//                               size: 20,
//                               color: ColorConstants.primaryColor,
//                             ),
//                             SizedBox(
//                               width: 8,
//                             ),
//                             Text(
//                               '4.5',
//                               style: TextStyle(
//                                 color: ColorConstants.dividerColor,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 34,
//                   ),
//                   const Text(
//                     'Description',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   const SizedBox(
//                     width: 300,
//                     child: Text(
//                       'Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.',
//                       style: TextStyle(
//                           color: ColorConstants.dividerColor,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           // IconButton(
//                           //   onPressed: () => controller1.addCounter(),
//                           //   icon: Icon(Icons.remove),
//                           // ),
//                           GestureDetector(
//                             onTap: () {
//                               decrementCounter();
//                               print(counter);
//                             },
//                             child: const Icon(Icons.remove),
//                           ),
//                           Text(
//                             counter < 0 ? '0' : '$counter',
//                             style: TextStyle(
//                               fontSize: 14.0,
//                               color: Colors.black,
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               addCounter();
//                               print(counter);
//                             },
//                             child: const Icon(Icons.add),
//                           ),
//                           // IconButton(
//                           //   onPressed: () => controller2.decrementCounter(),
//                           //   icon: Icon(Icons.add),
//                           // ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   // const SizedBox(
//                   //   height: 16,
//                   // ),
//                   // PrimaryBtn(
//                   //   label: 'Add to Cart',
//                   //   key: widget.key,
//                   // )
//                 ],
//               ),
//             ),
//           ),






// Top Section
// Container(
//           margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
//           child: Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               PageView.builder(
//                 itemCount: imagePath.length,
//                 onPageChanged: (value) {
//                   setState(() {
//                     _activePage = value;
//                   });
//                 },
//                 itemBuilder: (context, index) {
//                   return _pages[index];
//                 },
//               ),
//               // Code for Page Indicator
//               Container(
//                 color: Colors.transparent,
//                 margin: const EdgeInsets.only(bottom: 80),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: List<Widget>.generate(
//                     _pages.length,
//                     (index) => Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 4),
//                       child: Container(
//                         height: 4,
//                         width: 32,
//                         decoration: BoxDecoration(
//                           color: _activePage == index
//                               ? ColorConstants.primaryColor
//                               : ColorConstants.whiteColor,
//                           borderRadius: BorderRadius.circular(2),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),

// Leading AppBar Section
// Container(
//           margin: const EdgeInsets.only(left: 24),
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.white, width: 1),
//             shape: BoxShape.circle,
//           ),
//           child: IconButton(
//             padding: const EdgeInsets.all(1),
//             iconSize: 16,
//             icon: const Icon(
//               Icons.arrow_back_ios_new_sharp,
//               color: Colors.white,
//             ),
//             onPressed: () => Get.back(),
//           ),
//         ),

// Middle Text
// const Text(
//           'About This Menu',
//           style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               color: ColorConstants.whiteColor),
//         ),

// Trailing ICon
//  Container(
//             height: 36,
//             width: 36,
//             margin: const EdgeInsets.only(right: 24),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.white, width: 1),
//               shape: BoxShape.circle,
//             ),
//             child: IconButton(
//               padding: const EdgeInsets.all(1),
//               iconSize: 20,
//               icon: const Icon(
//                 Icons.favorite_border_outlined,
//                 color: Colors.white,
//               ),
//               onPressed: () {},
//             ),
//           ),


