import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lecture_log/core/theme/styles.dart';
import 'package:lecture_log/modules/progress/controller.dart';
import 'package:lecture_log/widgets/progress/task_card.dart';

class ProgressView extends StatelessWidget {
  ProgressView({super.key});

  final controller = Get.find<ProgressController>();

  final dummyData = <Map<String, dynamic>>[
    {
      'subject': 'Administrasi Jaringan',
      'description': 'Belajar subnetting lorem ipsum dolor sit amet',
      'icon': Iconsax.book_1_bold,
      'color': Styles.successColor,
    },
    {
      'subject': 'Komputasi Awan',
      'description':
          'Mengerjakan tugas cloud computing lorem ipsum dolor sit amet',
      'icon': Iconsax.clipboard_text_bold,
      'color': Styles.primaryColor,
    },
    {
      'subject': 'Pemrograman Web',
      'description':
          'Mengerjakan tugas membuat website lorem ipsum dolor sit amet',
      'icon': Iconsax.clipboard_text_bold,
      'color': Styles.primaryColor,
    },
    {
      'subject': 'Aplikasi Mobile',
      'description':
          'Belajar membuat aplikasi mobile lorem ipsum dolor sit amet',
      'icon': Iconsax.tick_circle_bold,
      'color': Styles.secondaryColor,
    },
  ];

  Widget dropdown(
      List<String> option, String selected, void Function(String?) onChanged) {
    return Container(
      height: 36,
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Styles.primaryColor,
      ),
      child: DropdownButton<String>(
        dropdownColor: Styles.primaryColor,
        borderRadius: BorderRadius.circular(18),
        underline: const SizedBox(),
        value: selected,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        iconSize: 20,
        items: option.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(),
                  labelText: 'Type to search...',
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Obx(
                      () => dropdown(
                        <String>['Daily', 'Weekly', 'Monthly'],
                        controller.selectedPeriodFilter.value,
                        (value) {
                          controller.selectedPeriodFilter.value =
                              value ?? 'Weekly';
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Obx(
                      () => dropdown(
                        <String>['All priority', 'Urgent', 'Normal'],
                        controller.selectedPriorityFilter.value,
                        (value) {
                          controller.selectedPriorityFilter.value =
                              value ?? 'All priority';
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Obx(
                      () => dropdown(
                        <String>['All types', 'Study plan', 'Assignments'],
                        controller.selectedSTypeFilter.value,
                        (value) {
                          controller.selectedSTypeFilter.value =
                              value ?? 'All types';
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Obx(
                      () => dropdown(
                        [
                          'All subjects',
                          ...dummyData.map((e) => e['subject'] as String)
                        ],
                        // <String>['All subjects', 'Math', 'Physics'],
                        controller.selectedSubjectFilter.value,
                        (value) {
                          controller.selectedSubjectFilter.value =
                              value ?? 'All subjects';
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: dummyData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        TaskCard(
                          subject: dummyData[index]['subject'],
                          description: dummyData[index]['description'],
                          icon: dummyData[index]['icon'],
                          color: dummyData[index]['color'],
                        ),
                        const SizedBox(height: 8),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
