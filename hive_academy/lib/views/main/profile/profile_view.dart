import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../shared_widgets/custom_text_form_field.dart';
import '../../../shared_widgets/primary_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                // physics: const BouncingScrollPhysics(),
                // reverse: true,
                child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Profile.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Profile',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(183, 183, 183, 1))),
                ),
                Row(
                  children: [
                    const IconButton(
                      onPressed: null,
                      icon: Icon(Icons.edit_attributes_outlined,
                          size: 30, color: Colors.white),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: const IconButton(
                        onPressed: null,
                        icon: Icon(Icons.edit_outlined,
                            size: 30, color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 15, 10, 0),
              child: DashedCircle(
                color: Theme.of(context).primaryColorDark,
                dashes: 45,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://ichef.bbci.co.uk/news/490/cpsprodpb/C870/production/_112921315_gettyimages-876284806.jpg',
                    placeholder: (context, url) => const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 249, 248, 245),
                      radius: 45,
                    ),
                    imageBuilder: (context, image) => CircleAvatar(
                      backgroundImage: image,
                      radius: 45,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
            Column(
              children: [
                CustomTextFormField(
                  label: const Text('First Name'),
                  hint: 'first name',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  label: const Text('Last Name'),
                  hint: 'last name',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your last name';
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
                const SizedBox(height: 20),
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
              ],
            ),
            const SizedBox(height: 30),
            PrimaryButton(
                buttonColor: Theme.of(context).primaryColor,
                text: 'Update',
                textColor: Colors.white,
                onPressed: () {}),
          ],
        ),
      ),
    ))));
  }
}
