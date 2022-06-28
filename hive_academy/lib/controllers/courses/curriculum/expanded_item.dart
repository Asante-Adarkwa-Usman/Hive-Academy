import 'package:get/get.dart';

class ExpandedItemClass {
  ExpandedItemClass({
    this.headerValue,
    this.body,
    this.isExpanded,
  });

  String? headerValue;
  String? body;
  RxBool? isExpanded;
}
