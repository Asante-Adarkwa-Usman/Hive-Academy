import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? label;
  final Widget? suffixIcon;
  final String? hint;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    Key? key,
    this.label,
    this.suffixIcon,
    this.hint,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.80,
      child: TextFormField(
          controller: controller,
          style: const TextStyle(fontSize: 18),
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
              label: label,
              labelStyle: TextStyle(color: Colors.grey[600]),
              hintText: hint,
              suffixIcon: suffixIcon,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Theme.of(context).primaryColor)))),
    );
  }
}
