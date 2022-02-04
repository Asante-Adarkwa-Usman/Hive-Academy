import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                        IconButton(
                            onPressed: null,
                            icon: Icon(Icons.notifications_outlined,
                                color: Theme.of(context).primaryColorDark),
                            focusColor: Theme.of(context).primaryColorDark),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: MediaQuery.of(context).size.width * 0.85,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.56,
                                      padding: const EdgeInsets.only(left: 15),
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
                                      color: Theme.of(context).primaryColorDark,
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
              ],
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
  const DiscountWidget({
    Key? key,
    required this.discountQuantity, required this.remainingType
  }) : super(key: key);

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
