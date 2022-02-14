import 'package:flutter/material.dart';
import 'package:hive_academy/shared_widgets/primary_button.dart';
import 'package:hive_academy/shared_widgets/custom_text_form_field.dart';
import 'package:hive_academy/views/auth/register_view.dart';

import '../parent_view.dart';

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
                    child: const Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(120, 120, 120, 1)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          label: const Text('Email'),
                          hint: 'email',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          label: const Text('Password'),
                          hint: 'password',
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
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
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const ParentView()),
                          (route) => false);
                    },
                    text: 'Login',
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
                                  builder: (context) => const RegisterView()));
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                "Create",
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    decoration: TextDecoration.underline),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.only(left: 20),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: MediaQuery.of(context).size.height * .20,
                  width: MediaQuery.of(context).size.width * 0.20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
