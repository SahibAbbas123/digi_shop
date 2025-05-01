import 'package:digi_shop/app/modules/registration/controllers/registration_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put(RegistrationController());  // Add this line
  runApp(
    GetMaterialApp(
      title: "DigiShop",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
