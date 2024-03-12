import 'package:get/get.dart';
import 'package:lecture_log/data/model/subject.dart';
import 'package:lecture_log/data/repository/local/subject_repository.dart';

class SubjectsController extends GetxController {
  final _subjectRepository = Get.find<SubjectRepository>();

  RxList<Subject> subjects = <Subject>[].obs;

  SubjectsController() {
    subjects = <Subject>[].obs;
    fetchSubjects();
  }

  Future<void> fetchSubjects() async {
    subjects.addAll(await _subjectRepository.getAll());
  }

  Future<void> reFetch() async {
    subjects.clear();
    subjects.addAll(await _subjectRepository.getAll());
  }
}
