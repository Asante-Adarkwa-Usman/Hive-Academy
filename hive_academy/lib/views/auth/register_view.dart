import 'package:flutter/material.dart';
import 'package:hive_academy/custom_widgets/hexagon_button.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  bool viewVisible = true;
  void showWidget() {
    setState(() {
      viewVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      viewVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          color: const Color.fromRGBO(254, 136, 4, .25),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: const EdgeInsets.only(left: 50),
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 80),
                Image.asset('assets/images/registerLogo.png',
                    width: 180, height: 160),
                const SizedBox(height: 90),
                FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.80,
                          child: TextFormField(
                              style: const TextStyle(fontSize: 18),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  label: const Text('First Name'),
                                  labelStyle:
                                      TextStyle(color: Colors.grey[600]),
                                  hintText: 'First Name',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Theme.of(context)
                                              .primaryColor)))),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.80,
                          child: TextFormField(
                              style: const TextStyle(fontSize: 18),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  label: const Text('Last Name'),
                                  labelStyle:
                                      TextStyle(color: Colors.grey[600]),
                                  hintText: 'Last Name',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Theme.of(context)
                                              .primaryColor)))),
                        ),
                        const SizedBox(height: 20),
                        const HexagonButton(
                          onTap: null,
                          icon: Icons.arrow_downward_outlined,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
