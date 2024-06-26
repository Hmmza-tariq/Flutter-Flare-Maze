import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/resources/theme_manager.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Flare Maze",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: getApplicationTheme(),
    ),
  );
}
