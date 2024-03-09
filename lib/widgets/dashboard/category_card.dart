import 'package:flutter/material.dart';
import 'package:lecture_log/core/theme/styles.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.color,
    required this.icon,
    required this.newitems,
    required this.total,
    required this.completed,
    required this.title,
  });

  final Color color;
  final IconData icon;
  final int newitems;
  final int total;
  final int completed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Styles.secondaryBackgroundColor,
          borderRadius: BorderRadius.circular(16),
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
              ],
            ),
            const SizedBox(height: 12),
            Text(
              '$newitems New',
              style: TextStyle(
                color: Styles.secondaryForegroundColor,
                fontSize: 12,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(8),
                    value: completed / total,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      color,
                    ),
                    backgroundColor: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: 4,
                    bottom: 4,
                  ),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Text(
                    '$completed/$total',
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
