import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_bottom_bar.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFF52BCEC),
        title: const Text('My Profile', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              'YUSUP SAEPULLOH',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text('NIM: 23552011236', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomBar(
        currentIndex: 1, 
        onTabSelected: (index) {},
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF52BCEC),
        onPressed: () {
          Get.snackbar(
            'Cart',
            'Keranjang masih kosong!',
            backgroundColor: Colors.blue[100],
            colorText: Colors.black,
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        child: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
