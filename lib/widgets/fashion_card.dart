import 'package:flutter/material.dart';
import '../models/fashion.dart';
import 'package:get/get.dart';
import '../controllers/fashion_controller.dart';
import '../pages/detail_page.dart';
import 'package:intl/intl.dart';

class FashionCard extends StatelessWidget {
  final Fashion fashion;
  FashionCard({required this.fashion});

  final FashionController controller = Get.find();
  final NumberFormat formatRupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => DetailPage(fashion: fashion)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(fashion.image, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          fashion.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: Obx(
                          () => Icon(
                            controller.isFavorite(fashion)
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                        ),
                        onPressed: () => controller.toggleFavorite(fashion),
                      ),
                    ],
                  ),
                  Text(
                    formatRupiah.format(fashion.price),
                    style: const TextStyle(color: Colors.black87),
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
