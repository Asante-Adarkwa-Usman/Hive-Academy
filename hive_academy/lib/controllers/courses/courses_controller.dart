import 'package:get/get.dart';
import 'package:hive_academy/controllers/courses/courses_repository.dart';

class CoursesController extends GetxController {
  CoursesRepository coursesRepository = CoursesRepository();
  List courses = [].obs;
  RxBool isLoading = false.obs;

  CoursesController() {
    loadCoursesFromRepo();
  }

  loadCoursesFromRepo() async {
    isLoading.value = true;
    courses = await coursesRepository.loadCoursesFromApi();
    update();
    isLoading.value = false;
    print(courses);
  }
}
