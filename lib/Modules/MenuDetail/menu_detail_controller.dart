import 'package:foodstore/Modules/Dashboard/Model/dashboard_model.dart';
import 'package:get/get.dart';

class MenuDetailController extends GetxController {
  Rx<FoodItem?> selectedFoodItem = Rx<FoodItem?>(null);
  RxInt counter = 1.obs;
  RxInt activePage = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  @override
  void onClose() {
    super.onClose();
    activePage.value = 0;
  }

  void increment() {
    counter.value++;
    updateTotalPrice();
  }

  void decrement() {
    if (counter.value > 1) {
      counter.value--;
      updateTotalPrice();
    }
  }

  void updateTotalPrice() {
    if (selectedFoodItem.value != null) {
      double price = selectedFoodItem.value!.price;
      totalPrice.value = price * counter.value;
    }
  }

  void setSelectedFoodItem(FoodItem item) {
    selectedFoodItem.value = item;

    counter.value = 1;
    updateTotalPrice();
  }

  String formatPrice(double price) {
    if (price % 1 == 0) {
      return price.toStringAsFixed(0);
    } else {
      return price.toStringAsFixed(2);
    }
  }

////////////////////////////////////////////////////
  var cartcounter1 = 1.obs;
  var cartcounter2 = 1.obs;

  void cartincrement1() {
    cartcounter1++;
  }

  void cartdecrement1() {
    if (cartcounter1 > 0) {
      cartcounter1--;
    }
  }

  void cartincrement2() {
    cartcounter2++;
  }

  void cartdecrement2() {
    if (cartcounter2 > 0) {
      cartcounter2--;
    }
  }
}
