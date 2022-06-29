import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_academy/controllers/courses/courses_controller.dart';
import 'package:hive_academy/controllers/courses/curriculum/expanded_item.dart';
import 'package:hive_academy/controllers/courses/curriculum/index.dart';

class CourseCurriculum extends StatelessWidget {
  CourseCurriculum({Key? key}) : super(key: key);
  final CoursesController _coursesController = Get.put(CoursesController());
  final CourseCurriculumController _coursesCurriculumController =
      Get.put(CourseCurriculumController());

  @override
  Widget build(BuildContext context) {
    var courses = _coursesController.courses;
    return SingleChildScrollView(
        child: Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Obx(() => ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            _coursesCurriculumController
                .courseItems[panelIndex].isExpanded!.value = !isExpanded;
          },
          children: _coursesCurriculumController.courseItems
              .map<ExpansionPanel>((ExpandedItemClass courseItems) {
            return ExpansionPanel(
                headerBuilder: ((context, isExpanded) {
                  return ListTile(
                    title: Text(courseItems.headerValue!),
                  );
                }),
                body: ListTile(
                  title: Text(courseItems.body!),
                ),
                isExpanded: courseItems.isExpanded!.value);
          }).toList())),
    ));
  }
}

// Widget _buildCourseTile(CourseTile courseTile) {
//   return ExpansionTile(
//       title: Text(courseTile.title.toString()),
//       children:
//           courseTile.courses.map((e) => _buildCourseTile(courseTile)).toList());
// }

// class CourseTile {
//   final String? title;
//   final List<CourseTile> courses;

//   CourseTile({required this.title, this.courses = const []});
// }

// final courseTile = <CourseTile>[
//   CourseTile(title: 'Adobe Photoshop', courses: [
//     CourseTile(title: 'Introduction to Adobe'),
//     CourseTile(title: 'Setting system environment'),
//     CourseTile(title: 'Starting with our first image'),
//     CourseTile(title: 'Making every image look good'),
//     CourseTile(title: 'Conclusion')
//   ]),
//   CourseTile(title: 'Game Development with C#', courses: [
//     CourseTile(title: 'Introduction to Course'),
//     CourseTile(title: 'Setting system environment'),
//     CourseTile(title: 'Starting with our first game design'),
//     CourseTile(title: 'Testing out the avators'),
//     CourseTile(title: 'Conclusion')
//   ]),
//   CourseTile(title: 'Mobile Development with flutter', courses: [
//     CourseTile(title: 'Introduction to Dart language'),
//     CourseTile(title: 'Setting system environment'),
//     CourseTile(title: 'Starting with our first dart program'),
//     CourseTile(title: 'Knowing the fundamentals of Dart'),
//     CourseTile(title: 'Developing skills in flutter'),
//     CourseTile(title: 'Building real time project'),
//     CourseTile(title: 'Testing out'),
//     CourseTile(title: 'Conclusion'),
//   ]),
// ];
