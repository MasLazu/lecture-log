import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lecture_log/core/theme/styles.dart';

class SujectCeateView extends StatelessWidget {
  const SujectCeateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Spacer(),
            Text('Create Subject'),
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
                Text(
                  'Name',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 4),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Subject name',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Icon',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 12),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Styles.primaryColor),
                        ),
                        child: const Text("Pick a color"),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 12),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            Styles.secondaryBackgroundColor),
                      ),
                      child: const Icon(
                        Iconsax.aave_aave_bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 4),
                const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(),
                    hintText: 'Subject description',
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                Text(
                  'Day',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 4),
                DropdownButtonFormField<int>(
                  dropdownColor: Styles.secondaryBackgroundColor,
                  hint: Text(
                    'Select day',
                    style: TextStyle(
                      color: Styles.mutedForegroundColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  items: List.generate(
                    7,
                    (index) => DropdownMenuItem<int>(
                      value: index,
                      child: Text(
                        [
                          'Monday',
                          'Tuesday',
                          'Wednesday',
                          'Thursday',
                          'Friday',
                          'Saturday',
                          'Sunday',
                        ][index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                Text(
                  'Time',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                data: ThemeData.dark(),
                                child: child!,
                              );
                            },
                          );
                          print(picked?.format(context) ?? 'null');
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 12),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              Styles.secondaryBackgroundColor),
                        ),
                        child: const Text("08:00"),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(" - "),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                data: ThemeData.dark(),
                                child: child!,
                              );
                            },
                          );
                          print(picked?.format(context) ?? 'null');
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 12),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              Styles.secondaryBackgroundColor),
                        ),
                        child: const Text("08:00"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Location',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 4),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Subject location',
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 16),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Styles.primaryColor),
                    ),
                    onPressed: () {},
                    child: const Text("Create"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
