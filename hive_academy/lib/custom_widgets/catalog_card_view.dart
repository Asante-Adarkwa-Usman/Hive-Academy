import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CatalogCard extends StatelessWidget {
  final String? subject;
  final String? imgSrc;
  final void Function()? onTap;
  final Color? color;
  const CatalogCard(
      {Key? key, this.subject, this.color, required this.onTap, this.imgSrc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.40,
      height: MediaQuery.of(context).size.height * 0.12,
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 5,
          color: color,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.asset(
                  'assets/images/category.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    subject.toString(),
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
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
