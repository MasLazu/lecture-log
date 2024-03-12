import 'package:get/get.dart';
import 'package:lecture_log/modules/subject_create/controller.dart';

class SubjectCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubjectCreateController>(() => SubjectCreateController());
  }
}
