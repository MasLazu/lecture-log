import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lecture_log/modules/dashboard/view.dart';

class HomeController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  static const List<Widget> _tabContents = <Widget>[
    DashboardView(),
    Center(
      child: Text(
        'Index 1: Subjects',
      ),
    ),
    Center(
      child: Text(
        'Index 2: Progress',
      ),
    ),
    Center(
      child: Text(
        'Index 3: Account',
      ),
    ),
  ];

  get tabContent => _tabContents[selectedIndex.value];

  void changeTab(int index) {
    selectedIndex.value = index;
    update();
  }
}
