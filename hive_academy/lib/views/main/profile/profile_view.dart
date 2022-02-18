import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

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
          image: AssetImage('assets/images/Profile.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Profile',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Row(
                  children: [
                    const IconButton(
                      onPressed: null,
                      icon: Icon(Icons.edit_attributes_outlined,
                          size: 30, color: Colors.white),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: const IconButton(
                        onPressed: null,
                        icon: Icon(Icons.edit_outlined,
                            size: 30, color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 15, 10, 0),
              child: DashedCircle(
                color: Theme.of(context).primaryColorDark,
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white54,
                    backgroundImage: NetworkImage(
                        'https://ichef.bbci.co.uk/news/490/cpsprodpb/C870/production/_112921315_gettyimages-876284806.jpg'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ))));
  }
}
