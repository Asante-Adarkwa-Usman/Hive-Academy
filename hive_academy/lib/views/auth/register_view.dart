import 'package:flutter/material.dart';
import 'package:hive_academy/custom_widgets/hexagon_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const <Widget>[
          HexagonButton(
            icon: Icons.arrow_downward_outlined,
            onTap: null,
          ),
        ],
      ),
    );
  }
}
