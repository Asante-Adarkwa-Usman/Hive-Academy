import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hive_academy/custom_widgets/community_card.dart';
import 'package:hive_academy/route/route.dart' as router;

class CommunityView extends StatefulWidget {
  const CommunityView({Key? key}) : super(key: key);

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  int _current = 0;
  final List<Widget> _carouselTextList = const [
    Text(
      'Chat with instructors and \n Engage with the Hive community',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    Text(
      'Chat with instructors and \n Engage with the Hive community',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    Text(
      'Chat with instructors and \n Engage with the Hive community',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  ];
  final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Profile.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(top: 15, left: 20),
                    child: const Text(
                      'Community',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(183, 183, 183, 1)),
                    )),
                Image.asset(
                  'assets/images/community.png',
                  width: MediaQuery.of(context).size.width * 0.45,
                ),
                const SizedBox(
                  height: 12,
                ),
                CarouselSlider(
                  carouselController: _carouselController,
                  items: _carouselTextList,
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      height: MediaQuery.of(context).size.height * 0.05,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 7),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 900),
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _carouselTextList.map((e) {
                    int index = _carouselTextList.indexOf(e);
                    return Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? const Color.fromRGBO(254, 156, 4, 1)
                              : const Color.fromRGBO(0, 0, 0, .2)),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CommunityCard(
                      onTap: () {
                        Navigator.pushNamed(context, router.chatPage);
                      },
                      title: 'Chat',
                      cardColor: Colors.black,
                      imageSrc: 'assets/images/chat.png',
                    ),
                    CommunityCard(
                      onTap: () {
                        Navigator.pushNamed(context, router.forumPage);
                      },
                      title: 'Forum',
                      cardColor: Theme.of(context).primaryColorDark,
                      imageSrc: 'assets/images/forum.png',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CommunityCard(
                  onTap: () {
                    Navigator.pushNamed(context, router.marketPage);
                  },
                  title: 'Market Place',
                  cardColor: const Color.fromRGBO(167, 167, 167, 1),
                  imageSrc: 'assets/images/market.png',
                ),
              ],
            ),
            //The Carousel

            // const SizedBox(height: 80),
          ]),
        ),
      ),
    );
  }
}
