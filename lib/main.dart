import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/home_page.dart';
import 'controllers/fashion_controller.dart';

void main() {
  runApp(GayaIDApp());
}

class GayaIDApp extends StatelessWidget {
  GayaIDApp({Key? key}) : super(key: key) {
    Get.put(FashionController());
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gaya ID',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF52BCEC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF52BCEC),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF52BCEC),
          foregroundColor: Colors.white,
        ),
      ),

      home: HomePage(),
    );
  }
}
