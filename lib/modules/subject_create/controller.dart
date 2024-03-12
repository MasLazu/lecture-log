import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lecture_log/core/theme/styles.dart';
import 'package:lecture_log/data/model/subject.dart';
import 'package:lecture_log/data/repository/local/subject_repository.dart';

class SubjectCreateController extends GetxController {
  final name = TextEditingController();
  final description = TextEditingController();
  final location = TextEditingController();
  int? day;
  final Rx<TimeOfDay?> start = Rx<TimeOfDay?>(null);
  final Rx<TimeOfDay?> end = Rx<TimeOfDay?>(null);
  Color? color = Styles.warningColor;

  final Rx<bool> isLoading = false.obs;

  final subjectRepository = Get.find<SubjectRepository>();

  String formatTime(TimeOfDay? time) {
    if (time == null) return 'tab to chose';
    String hour = time.hour.toString().padLeft(2, '0');
    String minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  Future<void> create() async {
    isLoading.value = true;

    try {
      if (name.text.isEmpty) throw Exception('Name is required');
      if (description.text.isEmpty) throw Exception('Description is required');
      if (location.text.isEmpty) throw Exception('Location is required');
      if (day == null) throw Exception('Day is required');
      if (start.value == null) throw Exception('Start time is required');
      if (end.value == null) throw Exception('End time is required');
      if (color == null) throw Exception('Color is required');

      try {
        await subjectRepository.insert(Subject(
          name: name.text,
          description: description.text,
          day: day!,
          start: start.value!,
          end: end.value!,
          location: location.text,
          color: color!,
        ));
        Get.back();
      } catch (e) {
        throw Exception('Something went wrong, please try again later');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }

    isLoading.value = false;
  }
}
