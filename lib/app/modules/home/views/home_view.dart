import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  static const noNotifications = Center(
    child: Text('No Notifications', style: TextStyle(fontSize: 20)),
  );

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('Digi Shop'),
            centerTitle: true,
          ),
          body: controller.selectedIndex.value == 0
              ? SingleChildScrollView(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 50,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categories.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            return Chip(
                              label: Text(controller.categories[index]),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('All Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.products.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final product = controller.products[index];
                          return Card(
                            elevation: 2,
                            child: ListTile(
                              title: Text(product['title']!),
                              subtitle: Text(product['price']!),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              : noNotifications,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeTabIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
            ],
          ),
        ));
  }
}
