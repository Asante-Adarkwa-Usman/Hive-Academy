import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hive_academy/custom_widgets/change_password_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  //Edit Profile
  void _showBottomSheet(context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        elevation: 2,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return const ChangePasswordView();
        });
  }

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
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.topLeft,
              child: const Text('Profile',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(183, 183, 183, 1))),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 15, 10, 0),
              child: DashedCircle(
                color: Theme.of(context).primaryColorDark,
                dashes: 45,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://ichef.bbci.co.uk/news/490/cpsprodpb/C870/production/_112921315_gettyimages-876284806.jpg',
                    placeholder: (context, url) => const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 249, 248, 245),
                      radius: 45,
                    ),
                    imageBuilder: (context, image) => CircleAvatar(
                      backgroundImage: image,
                      radius: 45,
                    ),
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 10),

            //const SizedBox(height: 20),

            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  const ProfileDetail(
                    detailText: 'First Name',
                    detailValue: 'John Doe',
                  ),
                  const SizedBox(height: 30),
                  const ProfileDetail(
                    detailText: 'Last Name',
                    detailValue: 'Usman',
                  ),
                  const SizedBox(height: 30),
                  const ProfileDetail(
                    detailText: 'Email',
                    detailValue: 'usman@kumasihive.com',
                  ),
                  const SizedBox(height: 30),
                  const ProfileDetail(
                    detailText: 'Contact',
                    detailValue: '+62 812-1234-1234',
                  ),
                  const SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          print('Logout');
                        },
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 237, 90, 90),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _showBottomSheet(context);
                        },
                        child: const Text(
                          'Change Password',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(183, 93, 93, 82),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ))));
  }
}

class ProfileDetail extends StatelessWidget {
  final String? detailText;
  final String? detailValue;
  const ProfileDetail({
    Key? key,
    required this.detailText,
    required this.detailValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Text(detailText.toString(),
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
          const SizedBox(width: 25),
          Text(detailValue.toString(),
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 18,
                  fontWeight: FontWeight.w400)),
        ]),
      ],
    );
  }
}
