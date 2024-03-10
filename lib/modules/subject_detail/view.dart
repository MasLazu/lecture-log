import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lecture_log/core/theme/styles.dart';
import 'package:lecture_log/widgets/progress/task_card.dart';

class SubjectDetailView extends StatelessWidget {
  final String name = 'Workshop Administrasi Jaringan';
  final String location = 'HH-103';
  final DateTimeRange time = DateTimeRange(
    start: DateTime.parse('2022-14-31 08:00:00Z'),
    end: DateTime.parse('2022-14-31 09:40:00Z'),
  );

  SubjectDetailView({super.key});

  String getDayName(DateTime date) {
    List<String> daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return daysOfWeek[date.weekday - 1];
  }

  String formatTime(DateTime time) {
    String hour = time.hour.toString().padLeft(2, '0');
    String minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Spacer(),
            Text('Subject Detail'),
          ],
        ),
        leading: IconButton(
          icon: const Icon(
            Iconsax.arrow_left_2_outline,
            color: Colors.white,
            size: 32,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.all(24),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Styles.secondaryColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // const SizedBox(
                          //   width: 16,
                          // ),
                          // Container(
                          //   padding: const EdgeInsets.all(13),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(20),
                          //     color: Styles.primaryColor,
                          //   ),
                          //   child: const Icon(
                          //     Iconsax.cpu_bold,
                          //     color: Colors.white,
                          //     size: 26,
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        location,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            getDayName(time.start),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          const Text('|'),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            '${formatTime(time.start)} - ${formatTime(time.end)}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Study Plan',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 18),
                    ),
                    const Text(
                      'See all',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Column(
                  children: [
                    TaskCard(
                      subject: 'Workshop Administrasi Jaringan',
                      description:
                          'Mengerjakan tugas subnetting lorem ipsum dolor sit amet',
                      icon: Iconsax.cpu_bold,
                      color: Styles.primaryColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notes',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 18),
                    ),
                    const Text(
                      'See all',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Styles.secondaryBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'AWS',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Iconsax.arrow_right_3_outline,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Mengerjakan tugas subnetting lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem isum dolor sit amet',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Styles.secondaryBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'AWS',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Iconsax.arrow_right_3_outline,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Mengerjakan tugas subnetting lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem isum dolor sit amet',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Assignments',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 18),
                    ),
                    const Text(
                      'See all',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Column(
                  children: [
                    TaskCard(
                      subject: 'Workshop Administrasi Jaringan',
                      description:
                          'Mengerjakan tugas subnetting lorem ipsum dolor sit amet',
                      icon: Iconsax.cpu_bold,
                      color: Styles.warningColor,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TaskCard(
                      subject: 'Workshop Administrasi Jaringan',
                      description:
                          'Mengerjakan tugas subnetting lorem ipsum dolor sit amet',
                      icon: Iconsax.clipboard_bold,
                      color: Styles.successColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
