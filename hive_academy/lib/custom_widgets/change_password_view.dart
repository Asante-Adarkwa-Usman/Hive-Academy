import 'package:flutter/material.dart';
import 'package:hive_academy/shared_widgets/custom_text_form_field.dart';
import 'package:hive_academy/shared_widgets/primary_button.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .7,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 100),
                  child: Text('Change Password',
                      style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close,
                          size: 25, color: Theme.of(context).primaryColorDark)),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/changePassword.png',
              scale: 0.8,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: const Text('New Password'),
              hint: 'Password',
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              label: const Text('Confirm Password'),
              hint: 'Confirm Password',
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please confirm your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            PrimaryButton(isLoading: false, text: 'Reset', onPressed: () {})
          ],
        ));
  }
}
