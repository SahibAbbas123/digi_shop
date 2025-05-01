import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    if (index >= 0 && index < 3) { // 3 is the number of bottom nav items
      selectedIndex.value = index;
    }
  }

  final categories = [
    'Electronics',
    'Jewelery',
    "Men's Clothing",
    "Women's Clothing"
  ];

  final productImages = [
    'assets/images/electronics.png',
    'assets/images/jewelery.png',
    'assets/images/mens_clothing.png',
    'assets/images/womens_clothing.png',
  ];

  final products = List.generate(10, (index) {
    return {
      'title': 'Product $index',
      'price': '\$${(20 + index * 5)}',
      'image': [
        'assets/images/electronics.png',
        'assets/images/jewelery.png',
        'assets/images/mens_clothing.png',
        'assets/images/womens_clothing.png',
      ][index % 4],
    };
  });
}
