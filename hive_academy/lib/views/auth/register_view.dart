import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_academy/shared_widgets/hexagon_button.dart';
import 'package:hive_academy/shared_widgets/primary_button.dart';
import 'package:hive_academy/shared_widgets/custom_text_form_field.dart';
import 'package:hive_academy/route/route.dart' as router;

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  String view = "name";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromRGBO(254, 136, 4, 0.247),
      child: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.hardEdge,
          fit: StackFit.passthrough,
          children: <Widget>[
            Positioned(
              child: HexagonButton(
                width: MediaQuery.of(context).size.width * 0.07,
                icon: Icons.arrow_back_outlined,
                color: Theme.of(context).primaryColorDark,
                onTap: () {
                  Get.back();
                },
                iconColor: Colors.white,
              ),
              left: 2,
              bottom: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 50),
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Image.asset('assets/images/registerLogo.png',
                      width: 180, height: 160),
                  const SizedBox(height: 90),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Visibility(
                              visible: view == "name",
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    CustomTextFormField(
                                      label: const Text('First Name'),
                                      hint: 'first name',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your full name';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextFormField(
                                      label: const Text('Last Name'),
                                      hint: 'last name',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your last name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Visibility(
                              visible: view == "email",
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    CustomTextFormField(
                                      label: const Text('Email'),
                                      hint: 'email',
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your email';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextFormField(
                                      label: const Text('Phone Number'),
                                      hint: 'phone number',
                                      keyboardType: TextInputType.phone,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your phone number';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Visibility(
                              visible: view == "password",
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    CustomTextFormField(
                                      label: const Text('Password'),
                                      hint: 'password',
                                      obscureText: !_passwordVisible,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Password is required';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextFormField(
                                      label: const Text('Confirm Password'),
                                      hint: 'confirm password',
                                      obscureText: !_passwordVisible,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Password does not match';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Visibility(
                                  visible: view != "name",
                                  child: HexagonButton(
                                    onTap: () {
                                      if (view == "email") {
                                        setState(() {
                                          view = "name";
                                        });
                                      } else if (view == "password") {
                                        setState(() {
                                          view = "email";
                                        });
                                      }
                                    },
                                    icon: Icons.arrow_upward_outlined,
                                    color: Colors.white,
                                    iconColor:
                                        Theme.of(context).primaryColorDark,
                                  ),
                                ),
                                Visibility(
                                  visible: view != "password",
                                  child: HexagonButton(
                                    onTap: () {
                                      if (view == 'name') {
                                        setState(() {
                                          view = "email";
                                        });
                                      } else if (view == 'email') {
                                        setState(() {
                                          view = "password";
                                        });
                                      }
                                    },
                                    icon: Icons.arrow_downward_outlined,
                                  ),
                                ),
                                Visibility(
                                  visible: view != "email" && view != "name",
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 30),
                                    child: PrimaryButton(
                                      isLoading: false,
                                      text: 'Complete',
                                      onPressed: () {
                                        Get.toNamed(router.loginPage);
                                      },
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
