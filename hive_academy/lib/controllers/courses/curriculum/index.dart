import 'package:get/get.dart';
import 'package:hive_academy/controllers/courses/courses_controller.dart';

import 'expanded_item.dart';

class CourseCurriculumController extends GetxController {
  late List<ExpandedItemClass> courseItems;
  final CoursesController _coursesController = Get.put(CoursesController());

  @override
  void onInit() {
    super.onInit();
    int? courseLength = _coursesController.courses[0]['curriculum'].length;
    courseItems = generateItems(courseLength);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  List<ExpandedItemClass> generateItems(int? courseLength) {
    var courses = _coursesController.courses;
    return List.generate(courseLength!, (int index) {
      return ExpandedItemClass(
          // headerValue: courses[0]['curriculum'][index]['lessons'][0]['name'],
          // expandedValue: courses[0]['curriculum'][index]['lessons'][0]['name']
          headerValue: courses[0]['curriculum'][index]['name'],
          body: courses[0]['curriculum'][index]['lessons'][0]['name'],
          isExpanded: false.obs);
    });
  }
}
