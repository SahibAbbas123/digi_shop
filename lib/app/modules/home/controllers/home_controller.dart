import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  var categories = <String>[].obs;
  var selectedCategory = ''.obs;
  var allProducts = [].obs;
  var filteredProducts = [].obs;
  var isLoading = false.obs;

  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    fetchCategories();
    fetchAllProducts();
    super.onInit();
  }

  void changeTabIndex(int index) {
    if (index >= 0 && index < 3) {
      // 3 is the number of bottom nav items
      selectedIndex.value = index;
    }
  }

  /// Called when the user submits a search or presses Enter
  void searchFromInput() {
    final keyword = searchTextController.text.trim();
    if (keyword.isEmpty) {
      // If input is empty, show all products
      filteredProducts.value = allProducts;
    } else {
      search(keyword);
    }
  }

  /// Filter products by keyword
  void search(String keyword) {
    isLoading.value = true;
    try {
      final results = allProducts.where((product) {
        final title = product['title'].toString().toLowerCase();
        return title.contains(keyword.toLowerCase());
      }).toList();
      filteredProducts.value = results;
    } catch (e) {
      print('Search error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Load product categories
  void fetchCategories() async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));
    if (response.statusCode == 200) {
      categories.assignAll(List<String>.from(json.decode(response.body)));
    }
  }

  /// Load all products and update both allProducts and filteredProducts
  void fetchAllProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      allProducts.assignAll(json.decode(response.body));
      filteredProducts.assignAll(allProducts);
    }
  }

  /// Filter products by selected category
  void filterByCategory(String category) async {
    selectedCategory.value = category;
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/category/$category'));
    if (response.statusCode == 200) {
      filteredProducts.assignAll(json.decode(response.body));
    }
  }
}
