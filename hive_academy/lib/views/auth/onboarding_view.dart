import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hive_academy/custom_widgets/video_player_view.dart';
import 'package:hive_academy/views/auth/login_view.dart';
import 'package:hive_academy/views/auth/register_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int _current = 0;
  final List<Widget> _carouselTextList = const [
    Text(
      'Take Video Course Take Video \n Course Take Video Course',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: Colors.grey,
      ),
    ),
    Text(
      'Take Video Course Take Video \n Course Take Video Course',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: Colors.grey,
      ),
    ),
    Text(
      'Take Video Course Take Video \n Course Take Video Course',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: Colors.grey,
      ),
    ),
  ];
  final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Onboarding.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SizedBox(
        // height: 500,
        child: ListView(
          children: [
            const SizedBox(height: 300, child: VideoPlayerView()),
            const InkWell(
              onTap: null,
              child: Text(
                'Take Video Course',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(254, 156, 4, 1),
                ),
              ),
            ),
            //The Carousel
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: CarouselSlider(
                carouselController: _carouselController,
                items: _carouselTextList,
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    height: MediaQuery.of(context).size.height * 0.09,
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _carouselTextList.map((e) {
                int index = _carouselTextList.indexOf(e);
                return Container(
                  width: 10,
                  height: 10,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? const Color.fromRGBO(254, 156, 4, 1)
                          : const Color.fromRGBO(0, 0, 0, .3)),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Kindly Choose One',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(150, 160, 160, 1),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginView()));
                        },
                        child: const Text('Login',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            height: 1.5,
                            width: 90.0,
                            color: const Color.fromRGBO(167, 167, 167, 1),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Text('Or',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(167, 167, 167, 1))),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            height: 1.5,
                            width: 90.0,
                            color: const Color.fromRGBO(167, 167, 167, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const RegisterView()));
                        },
                        child: Text('Join Us',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
