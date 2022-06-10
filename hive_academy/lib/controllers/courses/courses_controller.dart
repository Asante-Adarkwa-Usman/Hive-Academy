import 'package:get/get.dart';
import 'package:hive_academy/controllers/courses/courses_repository.dart';
import 'package:hive_academy/controllers/network/network_manager.dart';

class CoursesController extends GetxController {
  CoursesRepository coursesRepository = CoursesRepository();
  final NetworkManager _networkManager = Get.find<NetworkManager>();
  List courses = [].obs;
  RxBool isLoading = false.obs;
  RxBool isConnected = true.obs;

  checkConnection() {
    if (_networkManager.connectionStatus == 0) {
      return !isConnected.value;
    }
  }

  CoursesController() {
    checkConnection();
    loadCoursesFromRepo();
  }

  loadCoursesFromRepo() async {
    isLoading.value = true;
    try {
      courses = await coursesRepository.loadCoursesFromApi();
      isLoading.value = false;
      update();
      //storageBox.write('courses', courses);
    } catch (e) {
      isLoading.value = false;
      return 'Something went wrong';
    }
  }
}
