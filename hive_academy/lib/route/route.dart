import 'package:flutter/material.dart';

import 'package:hive_academy/views/main/course/course_view.dart';
import 'package:hive_academy/views/main/payment/payment_view.dart';
import 'package:hive_academy/views/main/profile/profile_view.dart';
import 'package:hive_academy/views/main/search/search_course_view.dart';
import 'package:hive_academy/views/auth/login_view.dart';
import 'package:hive_academy/views/auth/onboarding_view.dart';
import 'package:hive_academy/views/auth/register_view.dart';
import 'package:hive_academy/views/main/home/home_view.dart';

// Route Names
const String loginPage = '/login';
const String registerPage = '/register';
const String onboardingPage = '/onboarding';
const String homePage = '/home';
const String coursePage    = '/course';
const String paymentPage     = '/payment';
const String profilePage = '/profile';
const String searchCoursePage = '/search_course';

// Control our page route flow
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case onboardingPage:
      return MaterialPageRoute(builder: (context) =>const OnboardingView());
 case registerPage:
      return MaterialPageRoute(builder: (context) =>const RegisterView());
    case loginPage:
      return MaterialPageRoute(builder: (context) =>const LoginView());
    case homePage: 
      return MaterialPageRoute(builder: (context) =>const HomeView());
    case coursePage:
      return MaterialPageRoute(builder: (context) =>const CourseView());
    case paymentPage:
      return MaterialPageRoute(builder: (context) => const PaymentView());
    case profilePage:
      return MaterialPageRoute(builder: (context) => const ProfileView());
       case searchCoursePage:
      return MaterialPageRoute(builder: (context) => const SearchCourseView());
    default:
      throw('This route name does not exit');
  }
}
