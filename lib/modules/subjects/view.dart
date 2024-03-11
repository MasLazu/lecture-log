import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lecture_log/core/theme/styles.dart';
import 'package:lecture_log/data/model/subject.dart';
import 'package:lecture_log/data/repository/local/subject_repository.dart';
import 'package:lecture_log/widgets/subjects/subject_overview.dart';

class SubjectsView extends StatelessWidget {
  SubjectsView({super.key});

  final dummyData = <Map<String, dynamic>>[
    {
      'name': 'Administrasi Jaringan',
      'time': DateTimeRange(
        start: DateTime.parse('2022-12-31 08:00:00Z'),
        end: DateTime.parse('2022-12-31 09:40:00Z'),
      ),
      'icon': Iconsax.clipboard_bold,
      'color': Styles.successColor,
    },
    {
      'name': 'Komputasi Awan',
      'time': DateTimeRange(
        start: DateTime.parse('2022-12-31 10:30:00Z'),
        end: DateTime.parse('2022-12-31 13:00:00Z'),
      ),
      'icon': Iconsax.activity_bold,
      'color': Styles.primaryColor,
    },
    {
      'name': 'Pemrograman Web',
      'time': DateTimeRange(
        start: DateTime.parse('2022-13-31 08:00:00Z'),
        end: DateTime.parse('2022-13-31 09:40:00Z'),
      ),
      'icon': Iconsax.brush_1_bold,
      'color': Styles.warningColor,
    },
    {
      'name': 'Aplikasi Basis Mobile',
      'time': DateTimeRange(
        start: DateTime.parse('2022-13-31 09:40:00Z'),
        end: DateTime.parse('2022-13-31 11:20:00Z'),
      ),
      'icon': Iconsax.cpu_bold,
      'color': Styles.secondaryColor,
    },
    {
      'name': 'Pemrograman Berbasis Objek',
      'time': DateTimeRange(
        start: DateTime.parse('2022-14-31 08:00:00Z'),
        end: DateTime.parse('2022-14-31 09:40:00Z'),
      ),
      'icon': Iconsax.data_bold,
      'color': Styles.primaryColor,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subjects'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 5 / 6,
            ),
            itemCount: dummyData.length,
            itemBuilder: (context, index) {
              final data = dummyData[index];
              return SubjectOverview(
                name: data['name'],
                time: data['time'],
                icon: data['icon'],
                color: data['color'],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Styles.primaryColor,
        onPressed: () {
          SubjectRepository subjectRepository = Get.find<SubjectRepository>();
          subjectRepository.insert(
            Subject(
              name: 'Administrasi Jaringan',
              description:
                  'lorem ipsum dolor sit amet consectetur adipiscing elit',
              color: Styles.successColor,
              start: const TimeOfDay(hour: 8, minute: 0),
              end: const TimeOfDay(hour: 9, minute: 40),
              location: 'HH-103',
              day: 1,
            ),
          );
          subjectRepository.getAll().then((value) {
            for (var subject in value) {
              print(subject.toJson());
            }
          });
        },
        child: const Icon(
          Iconsax.add_outline,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
