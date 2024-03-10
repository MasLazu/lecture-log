import 'package:get/get.dart';
import 'package:lecture_log/modules/home/binding.dart';
import 'package:lecture_log/modules/home/view.dart';
import 'package:lecture_log/modules/subject_detail/view.dart';
import './route_names.dart';

var route = [
  GetPage(
    name: RouteNames.home,
    page: () => HomeView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: '${RouteNames.subject}/:id',
    page: () => SubjectDetailView(),
    transition: Transition.cupertino,
  ),
];
