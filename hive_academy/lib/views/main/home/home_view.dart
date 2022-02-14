import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:hive_academy/custom_widgets/course_card_view.dart';


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
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.width * 0.84,
                      child: Card(
                        color: Colors.white,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: Text(
                                    '5%',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.56,
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          alignment: Alignment.centerRight,
                                          child: IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.close,
                                                size: 24,
                                                color: Theme.of(context)
                                                    .primaryColorDark,
                                              ))),
                                      Text(
                                        'Back End with Node.js',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                      ),
                                    ]),
                                const SizedBox(height: 4),
                                const Text(
                                  'Discount ends',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(183, 183, 183, 1),
                                  ),
                                ),
                                Row(
                                  children: const <Widget>[
                                    DiscountWidget(
                                      discountQuantity: '10',
                                      remainingType: 'Days',
                                    ),
                                    DiscountWidget(
                                      discountQuantity: '300',
                                      remainingType: 'Hours',
                                    ),
                                    DiscountWidget(
                                      discountQuantity: '3600',
                                      remainingType: 'Minutes',
                                    ),
                                    DiscountWidget(
                                      discountQuantity: '12300',
                                      remainingType: 'Seconds',
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
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
                    height: MediaQuery.of(context).size.height * 0.30,
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
                          completionStatus: '2',
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 10);
                      },
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.fromLTRB(12, 8, 0,2),
                    child: Text('Catalog',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(183, 183, 183, 1),
                        )),
                  ),
                  //  const SizedBox(height: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: CustomScrollView(
                      primary: false,
                      slivers: <Widget>[
                        SliverPadding(
                          padding: const EdgeInsets.all(12),
                          sliver: SliverGrid.count(
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 12,
                            crossAxisCount: 2,
                            children: <Widget>[
                              Container(
                                // width: MediaQuery.of(context).size.width * 0.25,
                                // height: MediaQuery.of(context).size.height * 0.05,
                                padding: const EdgeInsets.all(8),
                                child: const Text(
                                    "He'd have you all unravel at the"),
                                color: Colors.green[100],
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text('Heed not the rabble'),
                                color: Colors.green[200],
                              ),
                               Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: MediaQuery.of(context).size.height * 0.20,
                                padding: const EdgeInsets.all(8),
                                child: const Text(
                                    "He'd have you all unravel at the"),
                                color: Colors.green[100],
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text('Heed not the rabble'),
                                color: Colors.green[200],
                              ),
                               Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: MediaQuery.of(context).size.height * 0.20,
                                padding: const EdgeInsets.all(8),
                                child: const Text(
                                    "He'd have you all unravel at the"),
                                color: Colors.green[100],
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text('Heed not the rabble'),
                                color: Colors.green[200],
                              ),
                                Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: MediaQuery.of(context).size.height * 0.20,
                                padding: const EdgeInsets.all(8),
                                child: const Text(
                                    "He'd have you all unravel at the"),
                                color: Colors.green[100],
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text('Heed not the rabble'),
                                color: Colors.green[200],
                              ), 
                            ],
                          ),
                        ),
                      ],
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

class DiscountWidget extends StatelessWidget {
  final String? discountQuantity;
  final String? remainingType;
  const DiscountWidget(
      {Key? key, required this.discountQuantity, required this.remainingType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.12,
              margin: const EdgeInsets.only(right: 5),
              child: Card(
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                      color: Theme.of(context).primaryColorDark,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      discountQuantity.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(183, 183, 183, 1),
                      ),
                    ),
                  )),
            ),
          ],
        ),
        //const SizedBox(height: 4),
        Text(
          remainingType.toString(),
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ],
      //  ],
    );
  }
}
