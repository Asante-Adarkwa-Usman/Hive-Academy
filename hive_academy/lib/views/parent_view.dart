import 'package:flutter/material.dart';
import 'package:hive_academy/shared_widgets/hexagon_button.dart';
import 'package:hive_academy/views/main/course/course_view.dart';
import 'package:hive_academy/views/main/payment/payment_view.dart';
import 'package:hive_academy/views/main/profile/profile_view.dart';
import 'main/home/home_view.dart';
import 'package:hive_academy/route/route.dart' as router;


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
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
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
              icon: const Icon(Icons.payments_outlined, size: 35),
              activeIcon: HexagonButton(
                icon: Icons.payments,
                iconColor: Theme.of(context).primaryColorDark,
                color: Colors.white,
              ),
              label: 'Payment',
              tooltip: 'Payments'),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person, size: 35),
              activeIcon: HexagonButton(
                icon: Icons.person,
                iconColor: Theme.of(context).primaryColorDark,
                color: Colors.white,
              ),
              label: 'Profile',
              tooltip: 'Profile Settings'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, router.searchCoursePage);
            },
            tooltip: 'Search Course',
            child: const Icon(Icons.search, size: 30, color: Colors.white)),
      ),
    );
  }
}
