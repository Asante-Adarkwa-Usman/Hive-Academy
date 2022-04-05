import 'package:flutter/material.dart';

class CommunityCard extends StatelessWidget {
  final String title;
  final Color cardColor;
  final String imageSrc;
  final void Function()? onTap;
  const CommunityCard({
    Key? key,
    required this.title,
    required this.cardColor,
    required this.imageSrc,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.20,
        child: Card(
          color: cardColor,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(30),
          // ),
          child: Column(
            children: [
              Container(
                child: Image.asset(imageSrc),
                margin: const EdgeInsets.only(top: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
