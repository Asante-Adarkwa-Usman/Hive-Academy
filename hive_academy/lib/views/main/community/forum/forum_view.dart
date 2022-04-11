import 'package:flutter/material.dart';

class ForumView extends StatelessWidget {
  const ForumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Forum', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(child: Text('Forum Screen')),
    );
  }
}
