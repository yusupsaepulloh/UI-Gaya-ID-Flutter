import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/fashion_controller.dart';
import '../widgets/fashion_card.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);

  final FashionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: Obx(() {
        final favs = controller.favorites;
        if (favs.isEmpty) {
          return Center(child: Text('No favorites yet'));
        }
        return ListView.separated(
          padding: EdgeInsets.all(12),
          separatorBuilder: (_, __) => SizedBox(height: 12),
          itemCount: favs.length,
          itemBuilder: (context, index) {
            final fashion = favs[index];
            return FashionCard(fashion: fashion);
          },
        );
      }),
    );
  }
}
