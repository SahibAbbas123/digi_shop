import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:digi_shop/app/routes/app_pages.dart';


// import '../routes/app_routes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

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
                    Get.toNamed(Routes.CART);
                    Get.back(); // Close drawer
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
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  onTap: () {
                    // Handle avatar tap - perhaps navigate to profile
                    controller.changeTabIndex(3);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    // If you want to use an image instead:
                    // backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                ),
              ),
            ],
          ),
          body: controller.selectedIndex.value == 0
              ? SingleChildScrollView(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Categories',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const Text('View All',
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
                        children: [
                          const Text('All Products',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          TextButton(
                            onPressed: () => Get.toNamed(Routes.ALL_PRODUCTS),
                            child: const Text('View All'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: 4, // Show 4 products in grid
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Get.toNamed(
                              Routes.PRODUCT_DETAILS,
                              arguments: {
                                'title': 'Green Nike Air Shoes',
                                'price': 2500.0,
                                'originalPrice': 2500.0,
                                'discount': 20,
                                'rating': 3.9,
                                'description':
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore...',
                                'image':
                                    'assets/images/green_nike_air_shoes.jpg',
                                'isInStock': true,
                              },
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(15),
                                      ),
                                      child: Image.asset(
                                        'assets/images/green_nike_air_shoes.jpg',
                                        width: double.infinity,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Green Nike Air Shoes',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: const [
                                            Text(
                                              '3.9',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 16,
                                              color: Colors.amber,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              '\$2500.0',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              : noNotifications,
          bottomNavigationBar: Obx(() => BottomNavigationBar(
                currentIndex: controller.selectedIndex.value,
                onTap: (index) {
                  if (index == 2) {
                    Get.toNamed(Routes.CART);
                  } else {
                    controller.changeTabIndex(index);
                  }
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.category),
                    label: 'Categories',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: 'Cart',
                  ),
                ],
              )),
        ));
  }
}
