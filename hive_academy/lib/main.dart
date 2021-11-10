import 'package:flutter/material.dart';
import 'package:hive_academy/home_view.dart';
import 'package:hive_academy/views/auth/onboarding_view.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hive Academy',
      theme: ThemeData(
        primaryColor: Colors.orange,
        primarySwatch: Colors.orange,
      ),
      darkTheme: ThemeData.dark(),
      home: SplashScreenView(
        duration: 4000,
        imageSize: 400,
        navigateRoute: const OnboardingView(),
        imageSrc: "assets/images/hiveLogo.png",
        text: 'powered by KUMASI HIVE',
        textType: TextType.NormalText,
        textStyle: const TextStyle(
          fontSize: 15.0,
          color: Color.fromRGBO(254, 156, 4, 1),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
