import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lecture_log/core/theme/styles.dart';
import 'package:lecture_log/modules/home/controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = Get.put(HomeController());

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.tabContent),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Iconsax.chart_square_bold),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.stickynote_bold),
              label: 'Subjects',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.align_left_bold),
              label: 'Progress',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.user_bold),
              label: 'Account',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: Styles.primaryColor,
          onTap: controller.changeTab,
        ),
      ),
    );
  }
}
