import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  int connectionStatus = 0;

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    getConnectionType();
    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        connectionStatus = 0;
      } else if (event == ConnectivityResult.mobile) {
        connectionStatus = 1;
      } else if (event == ConnectivityResult.wifi) {
        connectionStatus = 2;
      }
      update();
    });
  }

  Future<void> getConnectionType() async {
    var connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      throw 'Failed to get connectivity: ${e.message}';
    }
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        connectionStatus = 1;
        update();
        break;
      case ConnectivityResult.wifi:
        connectionStatus = 2;
        update();
        break;
      case ConnectivityResult.none:
        connectionStatus = 0;
        update();
        break;
      default:
        connectionStatus = 3;
        break;
    }
  }

  @override
  void onClose() {}
}
