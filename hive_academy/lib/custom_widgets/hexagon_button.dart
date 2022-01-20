import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';

class HexagonButton extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final Color? iconColor;
  final void Function()? onTap;

  const HexagonButton(
      {Key? key, this.icon, this.color, this.iconColor, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        child: HexagonWidget.pointy(
          width: 50,
          color: color ?? Theme.of(context).primaryColor,
          elevation: 8,
          child: Icon(
            icon,
            color: iconColor ?? Colors.white,
            size: 26,
          ),
        ),
      ),
    );
  }
}
