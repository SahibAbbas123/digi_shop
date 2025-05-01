import 'package:digi_shop/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/all_products_controller.dart';
class AllProductsView extends GetView<AllProductsController> {
  const AllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('All Products'),
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.products.length,
        itemBuilder: (context, index) {
          final product = controller.products[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('${product['id']}'),
              ),
              title: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(product['image'] as String),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              product['seller'] as String,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                            if (product['isVerified'] as bool)
                              const Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 14,
                              ),
                          ],
                        ),
                        Text(
                          product['title'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            ...List.generate(
                              5,
                              (i) => Icon(
                                i < (product['rating'] as int)
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.amber,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '\$${product['price']}',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              trailing: CircleAvatar(
                backgroundColor: Colors.grey[800],
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              onTap: () => Get.toNamed(
                Routes.PRODUCT_DETAILS,
                arguments: product,
              ),
            ),
          );
        },
      )),
    );
  }
}
