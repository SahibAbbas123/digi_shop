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
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Digi Shop',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Online Shopping App',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  selected: controller.selectedIndex.value == 0,
                  onTap: () {
                    controller.changeTabIndex(0);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.category),
                  title: Text('Categories'),
                  selected: controller.selectedIndex.value == 1,
                  onTap: () {
                    controller.changeTabIndex(1);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Cart'),
                  selected: controller.selectedIndex.value == 2,
                  onTap: () {
                    controller.changeTabIndex(2);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  selected: controller.selectedIndex.value == 3,
                  onTap: () {
                    controller.changeTabIndex(3);
                    Get.back();
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    Get.back();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help & Support'),
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Categories',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('View All',
                              style: TextStyle(color: Colors.blue)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 50,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categories.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            return Chip(
                                label: Text(controller.categories[index]));
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('All Products',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('View All',
                              style: TextStyle(color: Colors.blue)),
                        ],
                      ),
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
                              leading: Image.asset(
                                product['image']!,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
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
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: 'Notifications'),
            ],
          ),
        ));
  }
}
