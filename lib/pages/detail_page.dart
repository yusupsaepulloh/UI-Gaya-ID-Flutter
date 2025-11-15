import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/fashion.dart';
import '../controllers/fashion_controller.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final Fashion fashion;
  DetailPage({required this.fashion});

  final FashionController controller = Get.find();

  final NumberFormat formatRupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fashion.name),
        backgroundColor: const Color(0xFF52BCEC),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(fashion.image, height: 260, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          fashion.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Obx(
                        () => IconButton(
                          icon: Icon(
                            controller.isFavorite(fashion)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 28,
                            color: Colors.redAccent,
                          ),
                          onPressed: () => controller.toggleFavorite(fashion),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    formatRupiah.format(fashion.price),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    fashion.description,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF52BCEC),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Get.snackbar(
                          'Order',
                          'Pesanan untuk ${fashion.name} berhasil ditambahkan!',
                          backgroundColor: Colors.blue[100],
                          colorText: Colors.black,
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                      child: const Text(
                        'Order Now',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
