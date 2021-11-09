import 'package:flutter/material.dart';
import 'package:hive_academy/custom_widgets/video_player_view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

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
        child: Column(
          children: const [
            SizedBox(height: 300, child: VideoPlayerView()),
            Text(
              'Take Video Course',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(254, 156, 4, 1),
              ),
            ),
            //The Carousel texts go here
          ],
        ),
      ),
    ));
  }
}
