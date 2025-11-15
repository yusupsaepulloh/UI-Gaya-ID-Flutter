import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_bottom_bar.dart';
import 'package:get/get.dart';
import '../controllers/fashion_controller.dart';
import '../widgets/fashion_card.dart';
import 'favorite_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final FashionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFF52BCEC),
        title: const Text(
          'Gaya ID',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () => Get.to(() => FavoritePage()),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: controller.updateQuery,
              decoration: InputDecoration(
                hintText: 'Search fashion...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Obx(() {
          final list = controller.filteredFashions;
          if (list.isEmpty) {
            return const Center(
              child: Text(
                'No product found 👗',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final fashion = list[index];
              return FashionCard(fashion: fashion);
            },
          );
        }),
      ),

      bottomNavigationBar: CustomBottomBar(
        currentIndex: 0, 
        onTabSelected: (index) {},
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF52BCEC),
        elevation: 4,
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
