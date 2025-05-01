import 'package:get/get.dart';

class CartController extends GetxController {
  final cartItems = <Map<String, dynamic>>[].obs;
  final totalAmount = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    // Add sample items (remove this in production)
    cartItems.addAll([
      {
        'title': 'Green Nike Air Shoes',
        'category': 'Shoes & Snikers',
        'price': 4000.0,
        'quantity': 5, // Changed from 5.obs to 5
        'image': 'assets/images/green_nike_air_shoes.jpg',
      },
    ]);
    calculateTotal();
  }

  void incrementQuantity(int index) {
    var quantity = cartItems[index]['quantity'] as int;
    cartItems[index]['quantity'] = quantity + 1;
    calculateTotal();
  }

  void decrementQuantity(int index) {
    var quantity = cartItems[index]['quantity'] as int;
    if (quantity > 1) {
      cartItems[index]['quantity'] = quantity - 1;
      calculateTotal();
    }
  }

  void calculateTotal() {
    totalAmount.value = cartItems.fold(0.0, (sum, item) => 
      sum + (item['price'] * (item['quantity'] as num)));
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
    calculateTotal();
  }

  void checkout() {
    // Implement checkout logic
    Get.snackbar(
      'Success',
      'Order placed successfully!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
