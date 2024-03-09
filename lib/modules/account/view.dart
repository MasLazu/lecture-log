import 'package:flutter/material.dart';
import 'package:lecture_log/core/theme/styles.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/70517223?s=400&u=83db56d640e4f3a0b5ff99a607daef2bf304c2ac&v=4'),
                radius: 112,
              ),
              const SizedBox(height: 16),
              Text(
                'Fattachul Aziz',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 4),
              const Text('mfaziz@gmail.com'),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Theme',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Styles.secondaryBackgroundColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dark mode',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Switch(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Notification',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Styles.secondaryBackgroundColor,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mute all notification',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Switch(
                              value: false,
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Divider(
                          color: Colors.grey[600],
                          height: 2,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mute all alarm',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Switch(
                              value: true,
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
