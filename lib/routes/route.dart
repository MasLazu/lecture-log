import 'package:get/get.dart';
import 'package:lecture_log/modules/home/binding.dart';
import 'package:lecture_log/modules/home/view.dart';
import './route_names.dart';

var route = [
  GetPage(
    name: RouteNames.home,
    page: () => HomeView(),
    binding: HomeBinding(),
  ),
];
