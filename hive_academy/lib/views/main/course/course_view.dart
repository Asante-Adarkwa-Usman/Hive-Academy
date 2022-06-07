import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive_academy/controllers/courses/courses_controller.dart';
import 'package:hive_academy/controllers/courses/user_courses_controller.dart';
import 'package:hive_academy/controllers/network/network_manager.dart';
import 'package:hive_academy/custom_widgets/course_card_view.dart';
import 'package:hive_academy/custom_widgets/my_course_card_view.dart';
//import 'package:hive_academy/custom_widgets/search_error_widget.dart';
import 'package:hive_academy/route/route.dart' as router;
//import 'package:hive_academy/utils/storage_box/storage_constant.dart';

class CourseView extends StatefulWidget {
  CourseView({Key? key}) : super(key: key);

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final UserCoursesController _userCoursesController =
      Get.put(UserCoursesController());

  final NetworkManager _networkManager = Get.find<NetworkManager>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
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
                                    if (_userCoursesController
                                            .isLoading.value ==
                                        true) {
                                      return const Center(
                                        child: CircularProgressIndicator
                                            .adaptive(),
                                      );
                                    }
                                    if (_userCoursesController
                                        .userCourses.isEmpty) {
                                      return const Center(
                                        child: Text('No courses found',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                      );
                                    }
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
                                    return GridView.builder(
                                      itemCount: _userCoursesController
                                          .userCourses.length,
                                      itemBuilder: (context, index) =>
                                          CourseCardView(
                                              userCourse: true,
                                              courseTitle:
                                                  _userCoursesController
                                                          .userCourses[index]
                                                      ['name'],
                                              courseDescription:
                                                  _userCoursesController
                                                          .userCourses[index]
                                                      ['description'],
                                              onTap: () {}),
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
