import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lecture_log/core/theme/styles.dart';
import 'package:lecture_log/modules/subjects/controller.dart';
import 'package:lecture_log/routes/route_names.dart';
import 'package:lecture_log/widgets/subjects/subject_overview.dart';

class SubjectsView extends StatelessWidget {
  SubjectsView({super.key});

  final controller = Get.find<SubjectsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subjects'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Obx(
            () => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 5 / 6,
              ),
              itemCount: controller.subjects.length,
              itemBuilder: (context, index) {
                return SubjectOverview(
                  key: key,
                  subject: controller.subjects[index],
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Styles.primaryColor,
        onPressed: () {
          Get.toNamed(RouteNames.createSubject)!
              .then((_) => controller.reFetch());
        },
        child: const Icon(
          Iconsax.add_outline,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
