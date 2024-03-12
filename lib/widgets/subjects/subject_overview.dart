import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lecture_log/core/theme/styles.dart';
import 'package:lecture_log/data/model/subject.dart';
import 'package:lecture_log/routes/route_names.dart';

class SubjectOverview extends StatelessWidget {
  final Subject subject;

  const SubjectOverview({
    super.key,
    required this.subject,
  });

  String getDayName(int day) {
    List<String> daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return daysOfWeek[day];
  }

  String formatTime(TimeOfDay time) {
    String hour = time.hour.toString().padLeft(2, '0');
    String minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('${RouteNames.subject}/1'),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Styles.secondaryBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: subject.color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Iconsax.clipboard_bold,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const Icon(
                  Iconsax.arrow_right_3_outline,
                  color: Colors.white,
                  size: 28,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              subject.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 28),
            Text(
              getDayName(subject.day),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 2),
            Text(
              '${formatTime(subject.start)} - ${formatTime(subject.end)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
