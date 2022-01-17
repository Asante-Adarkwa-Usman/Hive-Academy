import 'package:flutter/material.dart';
import 'package:hive_academy/custom_widgets/primary_button.dart';
import 'package:hive_academy/views/auth/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Onboarding.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/loginIcon.png',
                  height: MediaQuery.of(context).size.height * .40,
                  width: MediaQuery.of(context).size.width * 0.80,
                ),
                const SizedBox(height: 10),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 40),
                      child: Text(
                        'Welcome',
                        style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: TextFormField(
                          style: const TextStyle(fontSize: 18),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              label: const Text('Email'),
                              labelStyle: TextStyle(color: Colors.grey[600]),
                              hintText: 'Email',
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Theme.of(context).primaryColor)))),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: TextFormField(
                          style: const TextStyle(fontSize: 18),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                              label: const Text('Password'),
                              labelStyle: TextStyle(color: Colors.grey[600]),
                              hintText: 'Password',
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Theme.of(context).primaryColor)))),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(right: 30),
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Forgot Password?',
                            style: TextStyle(color: Colors.grey[600])),
                      ),
                    ),
                    // const SizedBox(height: 20),
                    PrimaryButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegisterView()));
                      },
                      text: 'Login',
                      textColor: Colors.white,
                      buttonColor: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.only(top: 10, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.grey),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterView()));
                              },
                              child: Text(
                                "Create",
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    decoration: TextDecoration.underline),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
