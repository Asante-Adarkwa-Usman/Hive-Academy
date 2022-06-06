import 'package:flutter/material.dart';
import 'package:hive_academy/shared_widgets/primary_button.dart';

class SearchErrorWidget extends StatelessWidget {
  final String name;
  const SearchErrorWidget({
    Key? key,
    required this.name,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 170),
      child: Column(
        children: [
          Image.asset(
            'assets/images/error.png',
            scale: .85,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Oops, no courses owned',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Enroll on a course',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              // color: Color.fromRGBO(183, 183, 183, 1),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Visibility(
            visible: name == 'search' ? false : true,
            child: PrimaryButton(
                isLoading: false,
                text: 'Go to courses',
                fontSize: 15,
                textColor: Theme.of(context).primaryColorDark,
                onPressed: () {},
                width: MediaQuery.of(context).size.width * 0.48,
                height: MediaQuery.of(context).size.height * 0.05,
                buttonColor: const Color.fromARGB(255, 241, 205, 164)),
          )
        ],
      ),
    );
  }
}
