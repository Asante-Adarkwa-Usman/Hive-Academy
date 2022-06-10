import 'package:get/get.dart';

import 'user_courses_repository.dart';
//import 'package:hive_academy/utils/storage_box/storage_constant.dart';

class UserCoursesController extends GetxController {
  final UserCoursesRepository _userCoursesRepository = UserCoursesRepository();
  List userCourses = [].obs;
  RxBool isLoading = false.obs;

  UserCoursesController() {
    loadUserCoursesFromRepo();
  }

  loadUserCoursesFromRepo() async {
    isLoading.value = true;
    try {
      userCourses = await _userCoursesRepository.loadUserCoursesFromApi();
      isLoading.value = false;
      update();
      return userCourses;
    } catch (e) {
      return 'Something went wrong';
    }
  }
}
