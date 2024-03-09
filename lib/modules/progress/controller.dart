import 'package:get/get.dart';

class ProgressController extends GetxController {
  final RxString selectedSubjectFilter = 'All subjects'.obs;
  final RxString selectedSTypeFilter = 'All types'.obs;
  final RxString selectedPeriodFilter = 'Weekly'.obs;
  final RxString selectedPriorityFilter = 'All priorities'.obs;
}
