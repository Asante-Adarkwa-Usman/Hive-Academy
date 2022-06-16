import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_academy/controllers/courses/courses_controller.dart';
import 'package:hive_academy/utils/storage_box/storage_constant.dart';

class CourseDetails extends StatefulWidget {
  final String id;
  const CourseDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List userCourses = storageBox.read('userCourses');
  final CoursesController _coursesController = Get.put(CoursesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Profile.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Stack(clipBehavior: Clip.none, children: [
                  Card(
                    elevation: 0,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: CachedNetworkImage(
                            imageUrl: (_coursesController.courses.firstWhere(
                                (element) => element['course_id'] == widget.id,
                                orElse: () => null))['banner'],
                            fit: BoxFit.fitWidth,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.10,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                                strokeWidth: 2,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              (_coursesController.courses.firstWhere(
                                  (element) =>
                                      element['course_id'] == widget.id,
                                  orElse: () => null))['name'],
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: -34,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PriceCard(
                            text1: 'GH₵',
                            text2: (_coursesController.courses.firstWhere(
                                    (element) =>
                                        element['course_id'] == widget.id,
                                    orElse: () => null))['base_price']
                                .toString(),
                          ),
                          PriceCard(
                            text1: (_coursesController.courses.firstWhere(
                                    (element) =>
                                        element['course_id'] == widget.id,
                                    orElse: () => null))['total_lessons']
                                .toString(),
                            text2: 'Lessons',
                            cardColor: const Color.fromRGBO(183, 183, 183, 1),
                          ),
                        ],
                      ))
                ]),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PriceCard extends StatelessWidget {
  final String? text1;
  final String? text2;
  final Color? cardColor;
  const PriceCard({
    Key? key,
    this.text1,
    this.text2,
    this.cardColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.22,
      child: Card(
        elevation: 3,
        color: cardColor ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text1.toString(),
                style: const TextStyle(fontSize: 12, color: Colors.white)),
            Text(text2.toString(),
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
