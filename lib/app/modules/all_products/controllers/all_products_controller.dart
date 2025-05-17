import 'dart:convert';
import 'package:digi_shop/app/data/Models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class AllProductsController extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;
  final allProductsUrl = "https://fakestoreapi.com/products";

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(allProductsUrl));

      if (response.statusCode == 200) {
        List<dynamic> productsJson = json.decode(response.body);
        productList.value = productsJson
            .map((product) => ProductModel.fromJson(product))
            .toList();
      } else {
        Get.snackbar("Error", "Failed to fetch products");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
