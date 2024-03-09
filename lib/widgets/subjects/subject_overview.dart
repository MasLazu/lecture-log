import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lecture_log/core/theme/styles.dart';

class SubjectOverview extends StatelessWidget {
  final String name;
  final DateTimeRange time;
  final IconData icon;
  final Color color;

  const SubjectOverview({
    super.key,
    required this.name,
    required this.time,
    required this.icon,
    required this.color,
  });

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
    return Container(
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
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
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
            name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 28),
          Text(
            getDayName(time.start),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 2),
          Text(
            '${formatTime(time.start)} - ${formatTime(time.end)}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
