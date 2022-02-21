import 'package:flutter/material.dart';

class DiscountWidget extends StatelessWidget {
  final String? discountQuantity;
  final String? remainingType;
  const DiscountWidget(
      {Key? key, required this.discountQuantity, required this.remainingType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.12,
              margin: const EdgeInsets.only(right: 5),
              child: Card(
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                      color: Theme.of(context).primaryColorDark,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      discountQuantity.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(183, 183, 183, 1),
                      ),
                    ),
                  )),
            ),
          ],
        ),
        //const SizedBox(height: 4),
        Text(
          remainingType.toString(),
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ],
      //  ],
    );
  }
}
