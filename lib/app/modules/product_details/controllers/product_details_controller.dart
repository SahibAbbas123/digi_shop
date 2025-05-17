import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  var productData = {}.obs;
  var quantity = 1.obs;

  @override
  void onInit() {
    super.onInit();
    // Capture the product data from Get.arguments
    if (Get.arguments != null) {
      productData.value = Get.arguments;
    }
  }

  // Increment quantity
  void incrementQuantity() {
    quantity.value++;
  }

  // Decrement quantity
  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }
}
