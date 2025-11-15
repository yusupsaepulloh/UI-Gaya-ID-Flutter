import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:get/get.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const CustomBottomBar({
    Key? key,
    required this.currentIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 10,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: currentIndex == 0 ? const Color(0xFF52BCEC) : Colors.grey,
            ),
            tooltip: "Home",
            onPressed: () {
              if (currentIndex != 0) {
                Get.off(
                  () => HomePage(),
                  transition: Transition.fadeIn,
                  duration: const Duration(milliseconds: 400),
                );
              }
              onTabSelected(0);
            },
          ),

          const SizedBox(width: 24),
          IconButton(
            icon: Icon(
              Icons.person,
              color: currentIndex == 1 ? const Color(0xFF52BCEC) : Colors.grey,
            ),
            tooltip: "Profile",
            onPressed: () {
              if (currentIndex != 1) {
                Get.off(
                  () => const ProfilePage(),
                  transition: Transition.fadeIn,
                  duration: const Duration(milliseconds: 400),
                );
              }
              onTabSelected(1);
            },
          ),
        ],
      ),
    );
  }
}
