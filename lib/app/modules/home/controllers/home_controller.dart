import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  // Static dummy categories
  final categories = ['Electronics', 'Jewelery', "Men's Clothing", "Women's Clothing"];

  // Static dummy products
  final products = List.generate(
    10,
    (index) => {
      'title': 'Product $index',
      'price': '\$${(20 + index * 5)}',
    },
  );
}
