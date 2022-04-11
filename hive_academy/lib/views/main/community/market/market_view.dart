import 'package:flutter/material.dart';

class MarketView extends StatelessWidget {
  const MarketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title:
            const Text('Market Place', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(child: Text('Market Screen')),
    );
  }
}
