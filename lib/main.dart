import 'package:flutter/material.dart';
import 'package:lecture_log/core/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:lecture_log/data/repository/local/subject_repository.dart';
import 'package:lecture_log/routes/route.dart';
import 'package:lecture_log/routes/route_names.dart';

void main() {
  runApp(const FlectureLog());
}

void initRepository() {
  Get.lazyPut(() => SubjectRepository());
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
    );
  }
}
