import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:digi_shop/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  static const noNotifications = Center(
    child: Text('No Notifications', style: TextStyle(fontSize: 20)),
  );

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final searchcontroller = Get.find<HomeController>();

    return Obx(() => Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Digi Shop',
                          style: TextStyle(color: Colors.white, fontSize: 24)),
                      SizedBox(height: 10),
                      Text('Online Shopping App',
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  selected: controller.selectedIndex.value == 0,
                  onTap: () {
                    controller.changeTabIndex(0);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.category),
                  title: const Text('Categories'),
                  selected: controller.selectedIndex.value == 1,
                  onTap: () {
                    controller.changeTabIndex(1);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: const Text('Cart'),
                  selected: controller.selectedIndex.value == 2,
                  onTap: () {
                    Get.toNamed(Routes.CART);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Profile'),
                  selected: controller.selectedIndex.value == 3,
                  onTap: () {
                    controller.changeTabIndex(3);
                    Get.back();
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text(
              'Digi Shop',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 4,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 35,
                  width: 250,
                  child: TextField(
                    controller: searchcontroller.searchTextController,
                    onChanged: (_) => searchcontroller.searchFromInput(),
                    decoration: InputDecoration(
                      hintText: 'Search for products...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  onTap: () => controller.changeTabIndex(3),
                  child: const CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 20,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: controller.selectedIndex.value == 0
              ? controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Categories',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              TextButton(
                                onPressed: () =>
                                    Get.toNamed(Routes.ALL_PRODUCTS),
                                child: const Text('View All'),
                              ),
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
                                final category = controller.categories[index];
                                return ActionChip(
                                  label: Text(category),
                                  onPressed: () =>
                                      controller.filterByCategory(category),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('All Products',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              TextButton(
                                onPressed: () =>
                                    Get.toNamed(Routes.ALL_PRODUCTS),
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
                            itemCount: controller.filteredProducts.length,
                            itemBuilder: (context, index) {
                              final product =
                                  controller.filteredProducts[index];
                              return GestureDetector(
                                onTap: () => Get.toNamed(
                                  Routes.PRODUCT_DETAILS,
                                  arguments: product,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                            top: Radius.circular(15),
                                          ),
                                          child: Image.network(
                                            product['image'],
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
                                            Text(
                                              product['title'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              children: [
                                                Text(
                                                  product['rating']!['rate']
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 12),
                                                ),
                                                const Icon(
                                                  Icons.star,
                                                  size: 16,
                                                  color: Colors.amber,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "\$${product['price']}",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.all(
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
