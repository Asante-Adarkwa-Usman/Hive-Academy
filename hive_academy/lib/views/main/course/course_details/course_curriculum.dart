import 'package:flutter/material.dart';
import 'package:flexible_expansion_list/flexible_expansion_list.dart';
import 'package:get/get.dart';
import 'package:hive_academy/controllers/courses/courses_controller.dart';

class CourseCurriculum extends StatelessWidget {
  CourseCurriculum({Key? key}) : super(key: key);
  final CoursesController _coursesController = Get.put(CoursesController());

  @override
  Widget build(BuildContext context) {
    var courses = _coursesController.courses;
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: FlexibleExpansionList(
            itemCount: courses[0]['curriculum'].length,
            // headerBuilder: (BuildContext context, int index, bool isExpanded) {
            //   return const ListTile(
            //     title: Center(child: Text('')),
            //   );
            // },
            fixedItemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(courses[0]['curriculum'][index]['name']),
                trailing: const Icon(Icons.keyboard_arrow_down),
              );
            },
            expandedItemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListTile(
                  title: Text(courses[0]['curriculum'][index]['lessons'][index]
                      ['name']),
                  subtitle: Text(courses[0]['curriculum'][index]['lessons']
                      [index]['description']),
                ),
              );
            }));
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
