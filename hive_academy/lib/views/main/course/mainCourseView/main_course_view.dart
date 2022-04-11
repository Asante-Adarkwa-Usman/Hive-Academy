import 'package:flutter/material.dart';

class MainCourseView extends StatelessWidget {
  const MainCourseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('My Courses', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(child: Text('Main Course Screen')),
    );
  }
}
