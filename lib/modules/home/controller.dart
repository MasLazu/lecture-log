import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lecture_log/modules/account/view.dart';
import 'package:lecture_log/modules/dashboard/view.dart';
import 'package:lecture_log/modules/progress/controller.dart';
import 'package:lecture_log/modules/progress/view.dart';
import 'package:lecture_log/modules/subjects/controller.dart';
import 'package:lecture_log/modules/subjects/view.dart';

class HomeController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  List<Widget> _tabContents = [];

  HomeController() {
    Get.put(ProgressController());
    Get.put(SubjectsController());

    _tabContents = <Widget>[
      const DashboardView(),
      SubjectsView(),
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
    Get.delete<SubjectsController>();
    super.onClose();
  }
}
