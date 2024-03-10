import 'package:flutter/material.dart';
import 'package:lecture_log/core/theme/styles.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lecture_log/widgets/dashboard/category_card.dart';
import 'package:lecture_log/widgets/dashboard/daily_progress.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  'Fattachul Aziz',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(
                          left: 36,
                          right: 36,
                        ),
                        minimumSize: const Size(0, 36),
                      ),
                      child: const Text(
                        'Academic',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Non Academic',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Styles.mutedForegroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const DailyProgress(progress: 0.76),
                const SizedBox(height: 32),
                Text(
                  'Categoies',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Column(
                  children: [
                    Row(
                      children: [
                        CategoryCard(
                          title: "Assignments",
                          color: Styles.warningColor,
                          icon: Iconsax.note_1_bold,
                          newitems: 3,
                          total: 10,
                          completed: 4,
                        ),
                        const SizedBox(width: 16),
                        CategoryCard(
                          title: "Subjects",
                          color: Styles.successColor,
                          icon: Iconsax.note_1_bold,
                          newitems: 2,
                          total: 12,
                          completed: 7,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        CategoryCard(
                          title: "Course Class",
                          color: Styles.secondaryColor,
                          icon: Iconsax.note_1_bold,
                          newitems: 3,
                          total: 3,
                          completed: 2,
                        ),
                        const SizedBox(width: 16),
                        CategoryCard(
                          title: "Study Plan",
                          color: Styles.primaryColor,
                          icon: Iconsax.note_1_bold,
                          newitems: 2,
                          total: 11,
                          completed: 3,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
