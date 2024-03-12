import 'package:flutter/material.dart';
import 'package:lecture_log/core/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:lecture_log/data/repository/local/note_repository.dart';
import 'package:lecture_log/data/repository/local/subject_repository.dart';
import 'package:lecture_log/routes/route.dart';
import 'package:lecture_log/routes/route_names.dart';

void main() {
  runApp(const FlectureLog());
  initRepository();
}

void initRepository() {
  Get.lazyPut(() => SubjectRepository());
  Get.lazyPut(() => NoteRepository());
}

class FlectureLog extends StatelessWidget {
  const FlectureLog({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flecture Log',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme,
      getPages: route,
      initialRoute: RouteNames.home,
      themeMode: ThemeMode.dark,
    );
  }
}
