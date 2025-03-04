import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive_academy/controllers/courses/user_courses_controller.dart';
import 'package:hive_academy/controllers/network/network_manager.dart';
import 'package:hive_academy/custom_widgets/my_course_card_view.dart';
import 'package:hive_academy/route/route.dart' as router;
import 'package:hive_academy/views/main/course/course_details/course_details.dart';

class CourseView extends StatefulWidget {
  const CourseView({Key? key}) : super(key: key);

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final NetworkManager _networkManager = Get.find<NetworkManager>();
  final UserCoursesController _userCoursesController =
      Get.put(UserCoursesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(body: GetBuilder<NetworkManager>(builder: (_) {
        return _networkManager.connectionStatus == 1 ||
                _networkManager.connectionStatus == 2
            ? SingleChildScrollView(
                child: Center(
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Profile.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin:
                                      const EdgeInsets.only(top: 20, left: 20),
                                  child: const Text(
                                    'My Courses',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Color.fromRGBO(183, 183, 183, 1)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    margin: const EdgeInsets.only(left: 20),
                                    child: const Text(
                                        'Find all courses you own here')),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      //filled: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      labelText: 'Search',
                                      labelStyle: const TextStyle(
                                        color: Color.fromRGBO(183, 183, 183, 1),
                                      ),
                                      suffixIcon: Icon(
                                        Icons.search,
                                        size: 30,
                                        color:
                                            Theme.of(context).primaryColorDark,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(15, 25, 15, 0),
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: Obx(() {
                                    if (_networkManager.connectionStatus == 0) {
                                      Fluttertoast.showToast(
                                          msg: "No Internet Connection",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.TOP,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                    List userCourses =
                                        _userCoursesController.userCourses;

                                    if (_userCoursesController
                                            .isLoading.value ==
                                        true) {
                                      return const Center(
                                        child: CircularProgressIndicator
                                            .adaptive(),
                                      );
                                    }
                                    if (userCourses.isEmpty) {
                                      return const Center(
                                        child: Text('No Courses found',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                      );
                                    }

                                    return GridView.builder(
                                      itemCount: userCourses.length,
                                      itemBuilder: (context, index) =>
                                          MyCourseCardView(
                                              courseTitle: userCourses[index]
                                                  ['name'],
                                              courseBanner: userCourses[index]
                                                  ['banner'],
                                              completionPercentage:
                                                  userCourses[index]
                                                      ['lessons_completed'],
                                              lessonCount: userCourses[index]
                                                  ['total_lessons'],
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: ((context) =>
                                                            CourseDetails(
                                                                id: userCourses[
                                                                            index]
                                                                        [
                                                                        'course_id']
                                                                    .toString()))));
                                              }),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.92,
                                        crossAxisSpacing: 12,
                                        mainAxisSpacing: 12,
                                      ),
                                    );
                                  }),
                                )
                                //  SizedBox(
                                //     height: 20,
                                //   ),
                                //Or Show the Search Error Widget
                                //const SearchErrorWidget(name: 'course'),
                              ]),
                        ))),
              )
            : const Center(
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 6.0,
                ),
              );
      })),
    );
  }
}
