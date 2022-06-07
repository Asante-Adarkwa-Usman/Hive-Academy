import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive_academy/controllers/network/network_manager.dart';
import 'package:hive_academy/controllers/profile/profile_controller.dart';
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
  final NetworkManager networkManager = Get.put(NetworkManager());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ProfileController _profileController = Get.put(ProfileController());

  final RegExp emailRegexp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  bool isLoading = false;
  bool isSuccessful = false;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (p0, isKeyboardVisible) => Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Onboarding.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: GetBuilder<NetworkManager>(builder: (_) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Visibility(
                    visible: !isKeyboardVisible,
                    child: Image.asset(
                      'assets/images/loginIcon.png',
                      height: MediaQuery.of(context).size.height * .40,
                      width: MediaQuery.of(context).size.width * 0.80,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: isKeyboardVisible == true
                            ? const EdgeInsets.only(left: 40, top: 40)
                            : const EdgeInsets.only(left: 40),
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
                              controller: _emailController,
                              label: const Text('Email'),
                              hint: 'email',
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!emailRegexp.hasMatch(value)) {
                                  return 'Email is invalid';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              controller: _passwordController,
                              label: const Text('Password'),
                              hint: 'password',
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 8) {
                                  return 'Password should be 8 characters or more';
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
                        isLoading: isLoading,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            isSuccessful = await _profileController
                                .loadUserProfileFromRepo(_emailController.text,
                                    _passwordController.text);
                            setState(() {
                              isLoading = false;
                            });

                            if (isSuccessful == true) {
                              //success
                              Fluttertoast.showToast(
                                  msg: 'Login Successful',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.grey.shade800,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              Get.offAll(() => const ParentView());
                            } else {
                              //error
                              Fluttertoast.showToast(
                                msg:
                                    'Login Failed, User not found or credentials are incorrect',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Email and Password are required!',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
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
                                  Get.to(() => const RegisterView());
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
            );
          }),
        ),
      ),
    );
  }
}
