import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final quantity = 1.obs;
  final isFavorite = false.obs;

  final productData = {}.obs;

  @override
  void onInit() {
    super.onInit();
    // Get product data passed from arguments
    productData.value = Get.arguments ?? {};
  }

  void incrementQuantity() {
    quantity.value++;
  }

  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }
}
