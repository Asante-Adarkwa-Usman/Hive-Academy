import 'package:flutter/material.dart';

import 'package:hive_academy/views/main/course/course_view.dart';
import 'package:hive_academy/views/main/community/community_view.dart';
import 'package:hive_academy/views/main/community/market/market_view.dart';
import 'package:hive_academy/views/main/community/chat/chat_view.dart';
import 'package:hive_academy/views/main/community/forum/forum_view.dart';
import 'package:hive_academy/views/main/profile/profile_view.dart';
import 'package:hive_academy/views/main/profile/profile_from_home_view.dart';
import 'package:hive_academy/views/main/search/search_course_view.dart';
import 'package:hive_academy/views/auth/login_view.dart';
import 'package:hive_academy/views/auth/onboarding_view.dart';
import 'package:hive_academy/views/auth/register_view.dart';
import 'package:hive_academy/views/main/home/home_view.dart';
import 'package:hive_academy/views/main/course/mainCourseView/main_course_view.dart';

// Route Names
const String loginPage = '/login';
const String registerPage = '/register';
const String onboardingPage = '/onboarding';
const String homePage = '/home';
const String coursePage = '/course';
const String mainCoursePage = '/mainCourse';
const String communityPage = '/community';
const String marketPage = '/market';
const String chatPage = '/chat';
const String forumPage = '/forum';
const String profilePage = '/profile';
const String profileFromHomePage = '/profileFromHome';
const String searchCoursePage = '/search_course';

// Control our page route flow
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case onboardingPage:
      return MaterialPageRoute(builder: (context) => const OnboardingView());
    case registerPage:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case coursePage:
      return MaterialPageRoute(builder: (context) => const CourseView());
    case mainCoursePage:
      return MaterialPageRoute(builder: (context) => const MainCourseView());
    case communityPage:
      return MaterialPageRoute(builder: (context) => const CommunityView());
    case marketPage:
      return MaterialPageRoute(builder: (context) => const MarketView());
    case chatPage:
      return MaterialPageRoute(builder: (context) => const ChatView());
    case forumPage:
      return MaterialPageRoute(builder: (context) => const ForumView());
    case profilePage:
      return MaterialPageRoute(builder: (context) => const ProfileView());
    case profileFromHomePage:
      return MaterialPageRoute(
          builder: (context) => const ProfileFromHomeView());
    case searchCoursePage:
      return MaterialPageRoute(builder: (context) => const SearchCourseView());
    default:
      throw ('This route name does not exit');
  }
}
