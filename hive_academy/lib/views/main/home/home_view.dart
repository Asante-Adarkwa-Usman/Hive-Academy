import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:get/get.dart';
import 'package:hive_academy/controllers/courses/courses_controller.dart';
import 'package:hive_academy/controllers/network/network_manager.dart';
import 'package:hive_academy/custom_widgets/catalog_card_view.dart';
import 'package:hive_academy/custom_widgets/course_card_view.dart';
import 'package:hive_academy/custom_widgets/discount_card_view.dart';
import 'package:hive_academy/route/route.dart' as router;
import 'package:hive_academy/utils/storage_box/course_constant.dart';

class HomeView extends StatelessWidget {
  final CoursesController _coursesController = Get.put(CoursesController());
  final NetworkManager _networkManager = Get.find<NetworkManager>();
  final List courses = courseStorageBox.read('courses');

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          // reverse: true,
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Onboarding.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: GetBuilder<NetworkManager>(
          builder: (_) => (_networkManager.connectionStatus == 1 ||
                  _networkManager.connectionStatus == 2)
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: const Text(
                                  'Hello',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(183, 183, 183, 1),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: Text(
                                  'Mary',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Badge(
                                badgeColor: Colors.white,
                                animationType: BadgeAnimationType.slide,
                                position: BadgePosition.topEnd(top: 2, end: 4),
                                badgeContent: Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                ),
                                child: IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.notifications_outlined,
                                        color:
                                            Theme.of(context).primaryColorDark),
                                    focusColor:
                                        Theme.of(context).primaryColorDark),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, router.profileFromHomePage);
                                  },
                                  child: DashedCircle(
                                    color: Theme.of(context).primaryColorDark,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://ichef.bbci.co.uk/news/490/cpsprodpb/C870/production/_112921315_gettyimages-876284806.jpg',
                                        placeholder: (context, url) =>
                                            const CircleAvatar(
                                          backgroundColor: Colors.amber,
                                          radius: 18,
                                        ),
                                        imageBuilder: (context, image) =>
                                            CircleAvatar(
                                          backgroundImage: image,
                                          radius: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      const DiscountCard(
                        discountPercent: '10%',
                        title:
                            'Back End with Node.js End with Node.js End with Node.js ',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text('Featured',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(183, 183, 183, 1),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: TextButton(
                              onPressed: null,
                              child: Text('See All',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        height: MediaQuery.of(context).size.height * 0.26,
                        width: MediaQuery.of(context).size.width,
                        child: Obx(() {
                          if (_coursesController.isLoading.value == true) {
                            return const Center(
                                child: CircularProgressIndicator.adaptive());
                          }
                          if (courses.isEmpty) {
                            return const Center(
                              child: Text('No courses available'),
                            );
                          }

                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: courses.length,
                            itemBuilder: (context, index) {
                              return CourseCardView(
                                // onTap: () {
                                //   Navigator.pushNamed(
                                //       context, router.searchCoursePage);
                                // },
                                onTap: null,
                                courseBanner: courses[index]['banner'],

                                courseTitle: courses[index]['name'],
                                courseDescription: courses[index]['overview'],
                                lessons:
                                    courses[index]['total_lessons'].toString(),

                                priceTag:
                                    courses[index]['base_price'].toString(),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 10);
                            },
                          );
                        }),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(12, 8, 0, 8),
                        child: Text('Catalog',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(183, 183, 183, 1),
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.60,
                        child: Obx(() {
                          if (_coursesController.isLoading.value == true) {
                            return const Center(
                                child: CircularProgressIndicator.adaptive());
                          }
                          if (courses.isEmpty) {
                            return const Center(
                              child: Text('No category courses available'),
                            );
                          }
                          return GridView.builder(
                            itemBuilder: (context, index) => CatalogCard(
                                onTap: null,
                                subject: courses[index]['category']['name']),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 14,
                              mainAxisSpacing: 10,
                              crossAxisCount: 2,
                            ),
                            itemCount: courses.length,
                          );
                        }),
                      )
                    ],
                  ),
                )
              : const Center(
                  child: Text('No Internet Connection. Check and try again',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold))),
        ),
      )),
    ));
  }
}
