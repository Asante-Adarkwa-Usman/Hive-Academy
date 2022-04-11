import 'package:flutter/material.dart';
import 'package:hive_academy/custom_widgets/my_course_card_view.dart';
//import 'package:hive_academy/custom_widgets/search_error_widget.dart';
import 'package:hive_academy/route/route.dart' as router;

class CourseView extends StatelessWidget {
  const CourseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
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
                  margin: const EdgeInsets.only(top: 20, left: 20),
                  child: const Text(
                    'My Courses',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(183, 183, 183, 1)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text('Find all courses you own here')),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    decoration: InputDecoration(
                      //filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
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
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) => MyCourseCardView(
                        onTap: () {
                          Navigator.pushNamed(context, router.mainCoursePage);
                        },
                        completionPercentage: '25',
                        courseTitle: 'Game Development With Unity'),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.92,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                  ),
                )
                //  SizedBox(
                //     height: 20,
                //   ),
                //Or Show the Search Error Widget
                //const SearchErrorWidget(name: 'course'),
              ]),
        ),
      )),
    )));
  }
}
