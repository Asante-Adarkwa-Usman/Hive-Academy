import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String text;
  final GestureTapCallback onPressed;
  const PrimaryButton(
      {Key? key,
      required this.buttonColor,
      required this.textColor,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.06,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
          ),
          onPressed: onPressed,
          child: Text(text,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColor))),
    );
  }
}
