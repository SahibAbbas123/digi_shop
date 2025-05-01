import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_products_controller.dart';

class AllProductsView extends GetView<AllProductsController> {
  const AllProductsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllProductsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllProductsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
