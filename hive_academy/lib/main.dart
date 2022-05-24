import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_academy/views/auth/onboarding_view.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:hive_academy/route/route.dart' as router;
import 'controllers/network/network_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: NetworkBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Hive Academy',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(254, 136, 4, 1),
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreenView(
        duration: 4000,
        imageSize: 400,
        navigateRoute: const OnboardingView(),
        pageRouteTransition: PageRouteTransition.SlideTransition,
        imageSrc: "assets/images/hiveLogo.png",
        text: 'powered by KUMASI HIVE',
        textType: TextType.NormalText,
        textStyle: const TextStyle(
          fontSize: 15.0,
          color: Color.fromRGBO(254, 156, 4, 1),
        ),
        backgroundColor: Colors.white,
      ),
      onGenerateRoute: router.generateRoute,
    );
  }
}
