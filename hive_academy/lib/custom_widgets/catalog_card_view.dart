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
                child: Image.network(
                  imgSrc ??
                      'http://www.5ants.com/wp-content/uploads/2016/11/pcgame2-1-830x420.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    subject.toString(),
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
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
