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
                              fontSize: 20,
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
                              fontSize: 30,
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
                                radius: 20,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
