import 'package:flutter/material.dart';
import 'package:lecture_log/core/theme/styles.dart';

class DailyProgress extends StatelessWidget {
  const DailyProgress({super.key, required this.progress});

  final double progress;

  Widget dailyProgressCard(BuildContext context, double margin) {
    return Container(
      margin: EdgeInsets.only(right: margin, left: margin),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
        color: Styles.secondaryBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daily progress',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Here you can see your daily task',
              style: TextStyle(
                color: Styles.secondaryForegroundColor,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 20),
            Text("${(progress * 100).toInt()}%"),
            const SizedBox(height: 2),
            LinearProgressIndicator(
              minHeight: 6,
              borderRadius: BorderRadius.circular(8),
              value: progress,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Colors.blue,
              ),
              backgroundColor: Colors.grey[600],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(0, 16),
          child: dailyProgressCard(context, 16),
        ),
        Transform.translate(
          offset: const Offset(0, 8),
          child: dailyProgressCard(context, 8),
        ),
        dailyProgressCard(context, 0),
      ],
    );
  }
}
