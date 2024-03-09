import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lecture_log/modules/account/view.dart';
import 'package:lecture_log/modules/dashboard/view.dart';
import 'package:lecture_log/modules/progress/controller.dart';
import 'package:lecture_log/modules/progress/view.dart';

class HomeController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  List<Widget> _tabContents = [];

  HomeController() {
    Get.put(ProgressController());
    _tabContents = <Widget>[
      const DashboardView(),
      const Center(
        child: Text(
          'Index 1: Subjects',
        ),
      ),
      ProgressView(),
      const AccountView(),
    ];
  }

  get tabContent => _tabContents[selectedIndex.value];

  void changeTab(int index) {
    selectedIndex.value = index;
    update();
  }

  @override
  void onClose() {
    Get.delete<ProgressController>();
    super.onClose();
  }
}
