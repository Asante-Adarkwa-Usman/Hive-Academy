import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:hive_academy/custom_widgets/catalog_card_view.dart';
import 'package:hive_academy/custom_widgets/course_card_view.dart';
import 'package:hive_academy/custom_widgets/discount_card_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
            child: SingleChildScrollView(
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
                                    color: Theme.of(context).primaryColorDark),
                                focusColor: Theme.of(context).primaryColorDark),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                            child: DashedCircle(
                              color: Theme.of(context).primaryColorDark,
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.white54,
                                  backgroundImage: NetworkImage(
                                      'https://ichef.bbci.co.uk/news/490/cpsprodpb/C870/production/_112921315_gettyimages-876284806.jpg'),
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
                    height: MediaQuery.of(context).size.height * 0.28,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const CourseCardView(
                          // onTap: () {
                          //   Navigator.pushNamed(
                          //       context, router.searchCoursePage);
                          // },
                          onTap: null,
                          courseTitle: 'Back End with Node.js',
                          courseDescription:
                              'Building backend Services with JavaScript and Node.js Building backend Services with JavaScript and Node.js Building backend Services with JavaScript and Node.js Building backend Services with JavaScript and Node.js Building backend Services with JavaScript and Node.js Building backend Services with JavaScript and Node.js',
                          completionStatus: '0',
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 10);
                      },
                    ),
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
                    child: GridView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => const CatalogCard(
                          onTap: null, subject: 'Artificial Intelligence(AI)'),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
