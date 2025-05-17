import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_products_controller.dart';

class AllProductsView extends GetView<AllProductsController> {
  const AllProductsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AllProductsView'), centerTitle: true),
      body: Obx(() {
        /// initially a loading will show
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        /// After got the List from Api, then it will show
        return ListView.builder(
          itemCount: controller.productList.length,
          itemBuilder: (context, index) {
            final product = controller.productList[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                leading: Image.network(
                  product.image,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(product.title),
                subtitle: Text('\$${product.price}'),
              ),
            );
          },
        );
      }),
    );
  }
}
