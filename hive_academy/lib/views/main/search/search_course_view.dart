import 'package:flutter/material.dart';
//import 'package:hive_academy/custom_widgets/my_course_card_view.dart';
import 'package:hive_academy/custom_widgets/search_error_widget.dart';

class SearchCourseView extends StatelessWidget {
  const SearchCourseView({Key? key}) : super(key: key);

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
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 20, left: 20),
                  child: const Text(
                    'Search Courses',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(183, 183, 183, 1)),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text('Search for all courses ',
                        style: TextStyle(fontWeight: FontWeight.w700))),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text(
                        'Using course titles, category names, etc... ',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(183, 183, 183, 1)))),
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
                  height: 20,
                ),
                const SearchErrorWidget(name: 'search'),
              ]),
        ),
      )),
    )));
  }
}
