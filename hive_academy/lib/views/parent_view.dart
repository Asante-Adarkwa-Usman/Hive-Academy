import 'package:flutter/material.dart';
import 'package:hive_academy/custom_widgets/hexagon_button.dart';
import 'package:hive_academy/views/main/course/course_view.dart';
import 'package:hive_academy/views/main/payment/payment_view.dart';
import 'package:hive_academy/views/main/profile/profile_view.dart';
import 'package:hive_academy/views/main/search/search_course_view.dart';

import 'main/home/home_view.dart';

class ParentView extends StatefulWidget {
  const ParentView({Key? key}) : super(key: key);

  @override
  State<ParentView> createState() => _ParentViewState();
}

class _ParentViewState extends State<ParentView> {
  int _currentIndex = 0;
  final List<Widget> _views = [
    const HomeView(),
    const CourseView(),
    const SearchCourseView(),
    const PaymentView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: _views,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade300,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined, size: 30),
              activeIcon: HexagonButton(
                icon: Icons.home,
                iconColor: Theme.of(context).primaryColorDark,
                color: Colors.white,
              ),
              label: 'Home',
              tooltip: 'Homescreen'),
          BottomNavigationBarItem(
              icon: const Icon(Icons.view_array_outlined, size: 30),
              activeIcon: HexagonButton(
                icon: Icons.view_array,
                iconColor: Theme.of(context).primaryColorDark,
                color: Colors.white,
              ),
              label: 'Courses',
              tooltip: 'Courses'),
          BottomNavigationBarItem(
              icon: const Icon(Icons.search_outlined, size: 30),
              activeIcon: HexagonButton(
                icon: Icons.search,
                iconColor: Theme.of(context).primaryColorDark,
                color: Colors.white,
              ),
              label: 'Search',
              tooltip: 'Set Appointments'),
          BottomNavigationBarItem(
              icon: const Icon(Icons.payments_outlined, size: 30),
              activeIcon: HexagonButton(
                icon: Icons.payments,
                iconColor: Theme.of(context).primaryColorDark,
                color: Colors.white,
              ),
              label: 'Payment',
              tooltip: 'Payments'),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person, size: 30),
              activeIcon: HexagonButton(
                icon: Icons.person,
                iconColor: Theme.of(context).primaryColorDark,
                color: Colors.white,
              ),
              label: 'Profile',
              tooltip: 'Profile Settings'),
        ],
      ),
    );
  }
}
