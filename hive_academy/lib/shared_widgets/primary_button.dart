import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? textColor;
  final String text;
  final double? height;
  final double? width;
  final GestureTapCallback? onPressed;
  const PrimaryButton(
      {Key? key,
      this.buttonColor,
      this.textColor,
      required this.text,
      this.height,
      this.width,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .5,
      child: SizedBox(
        width: width ?? MediaQuery.of(context).size.width * 0.8,
        height: height ?? MediaQuery.of(context).size.height * 0.06,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: buttonColor ?? Theme.of(context).primaryColor,
            ),
            onPressed: onPressed,
            child: Text(text,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor ?? Colors.white))),
      ),
    );
  }
}
