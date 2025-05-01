import 'package:get/get.dart';

class AllProductsController extends GetxController {
  final count = 0.obs;

  final products = [
    {
      'id': 1,
      'title': 'Green Nike Air Shoes',
      'seller': 'Shoes & Snikers',
      'price': 4000.0,
      'rating': 4,
      'image': 'assets/images/green_nike_air_shoes.jpg',
      'isVerified': true,
    },
    // Add more products with incremental IDs
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
