import 'package:flutter/material.dart';
import 'package:hive_academy/custom_widgets/discount_widget_view.dart';

class DiscountCard extends StatefulWidget {
  final String? discountPercent;
  final String? title;

  const DiscountCard({
    required this.discountPercent,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<DiscountCard> createState() => _DiscountCardState();
}

class _DiscountCardState extends State<DiscountCard> {
  bool showCard = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width * 0.84,
        child: Visibility(
          visible: showCard,
          child: Card(
            color: Colors.white,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 15, 24),
                      child: Text(
                        widget.discountPercent ?? '5%',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              width: MediaQuery.of(context).size.width * 0.56,
                              padding: const EdgeInsets.only(left: 15),
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                  // onPressed: (() {
                                  //   setState(() {
                                  //     showCard = !showCard;
                                  //   });
                                  // }),
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.close,
                                    size: 24,
                                    color: Theme.of(context).primaryColorDark,
                                  ))),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.56,
                            child: Flexible(
                              child: Text(
                                widget.title.toString(),
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                              ),
                            ),
                          ),
                        ]),
                    const SizedBox(height: 4),
                    const Text(
                      'Discount ends',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(183, 183, 183, 1),
                      ),
                    ),
                    Row(
                      children: const <Widget>[
                        DiscountWidget(
                          discountQuantity: '10',
                          remainingType: 'Days',
                        ),
                        DiscountWidget(
                          discountQuantity: '300',
                          remainingType: 'Hours',
                        ),
                        DiscountWidget(
                          discountQuantity: '3600',
                          remainingType: 'Minutes',
                        ),
                        DiscountWidget(
                          discountQuantity: '12300',
                          remainingType: 'Seconds',
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
