import 'package:get/get.dart';
import '../models/fashion.dart';

class FashionController extends GetxController {

  final fashions = <Fashion>[
    Fashion(
      id: 1,
      name: 'T-Shirt Basic',
      image: 'assets/images/tshirt.png',
      description:
          'Kaos basic berbahan katun lembut, nyaman dipakai sehari-hari.',
      price: 99000,
    ),
    Fashion(
      id: 2,
      name: 'Hoodie Cozy',
      image: 'assets/images/hoodie.png',
      description:
          'Hoodie tebal dengan inner fleece, hangat dan tetap stylish untuk cuaca dingin.',
      price: 155000,
    ),
    Fashion(
      id: 3,
      name: 'Summer Dress',
      image: 'assets/images/dress.png',
      description:
          'Dress ringan dengan desain kasual, cocok untuk acara santai di musim panas.',
      price: 120000,
    ),
    Fashion(
      id: 4,
      name: 'Sneakers Urban',
      image: 'assets/images/sneakers.png',
      description:
          'Sneakers nyaman dengan tampilan modern untuk aktivitas sehari-hari.',
      price: 350000,
    ),
  ].obs;

  final query = ''.obs;

  List<Fashion> get filteredFashions {
    if (query.isEmpty) return fashions;
    return fashions
        .where(
          (f) =>
              f.name.toLowerCase().contains(query.value.toLowerCase()) ||
              f.description.toLowerCase().contains(query.value.toLowerCase()),
        )
        .toList();
  }

  void updateQuery(String text) {
    query.value = text;
  }

  final favorites = <Fashion>[].obs;

  void toggleFavorite(Fashion f) {
    if (favorites.contains(f)) {
      favorites.remove(f);
    } else {
      favorites.add(f);
    }
  }

  bool isFavorite(Fashion f) => favorites.contains(f);
}
