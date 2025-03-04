import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive_academy/controllers/network/network_manager.dart';
import 'package:hive_academy/shared_widgets/hexagon_button.dart';
import 'package:hive_academy/shared_widgets/primary_button.dart';
import 'package:hive_academy/shared_widgets/custom_text_form_field.dart';
import 'package:hive_academy/utils/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hive_academy/route/route.dart' as router;
import 'package:unicons/unicons.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  NetworkManager networkManager = Get.put(NetworkManager());
  String view = "name";
  final ImagePicker _imagePicker = ImagePicker();
  String _imageFile = '';

  Future selectImage({ImageSource imageSource = ImageSource.camera}) async {
    XFile? selectedFile = await _imagePicker.pickImage(source: imageSource);

    if (selectedFile != null) {
      final croppedFile = await myImageCropper(selectedFile.path);
      if (croppedFile != null) {
        setState(() {
          _imageFile = croppedFile.path;
        });
      }
    }
    print(_imageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromRGBO(254, 136, 4, 0.247),
      child: GetBuilder<NetworkManager>(builder: (_) {
        return SingleChildScrollView(
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
                    // Image.asset('assets/images/registerLogo.png',
                    //     width: 180, height: 160),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: _imageFile == ''
                            ? Image.asset(
                                'assets/images/user.png',
                                width: 130,
                                height: 130,
                                fit: BoxFit.contain,
                              )
                            : Image.file(File(_imageFile),
                                width: 130, height: 130, fit: BoxFit.fill),
                      ),
                    ),
                    TextButton.icon(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: 150,
                                  child: Column(
                                    children: [
                                      TextButton.icon(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            selectImage(
                                                imageSource:
                                                    ImageSource.camera);
                                          },
                                          icon: const Icon(UniconsLine.camera),
                                          label:
                                              const Text('Select from Camera')),
                                      TextButton.icon(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            selectImage(
                                                imageSource:
                                                    ImageSource.gallery);
                                          },
                                          icon: const Icon(UniconsLine.picture),
                                          label:
                                              const Text('Select from Gallery'))
                                    ],
                                  ),
                                );
                              });
                        },
                        icon: Icon(
                          UniconsLine.camera,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        label: Text(
                          'Select Profile Picture',
                          style: TextStyle(
                              color: Theme.of(context).primaryColorDark),
                        )),

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
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                          // if (networkManager.connectionStatus !=
                                          //         1 ||
                                          //     networkManager.connectionStatus !=
                                          //         2) {
                                          //   Fluttertoast.showToast(
                                          //       msg:
                                          //           'Waiting for network connection',
                                          //       toastLength: Toast.LENGTH_LONG,
                                          //       gravity: ToastGravity.BOTTOM,
                                          //       timeInSecForIosWeb: 1,
                                          //       backgroundColor: Colors.red,
                                          //       textColor: Colors.white,
                                          //       fontSize: 16.0);
                                          // }
                                          Get.toNamed(router.loginPage);
                                        },
                                        width:
                                            MediaQuery.of(context).size.width *
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
        );
      }),
    ));
  }
}
