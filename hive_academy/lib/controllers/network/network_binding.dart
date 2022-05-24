import 'package:get/get.dart';
import 'package:hive_academy/controllers/network/network_manager.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkManager>(() => NetworkManager());
  }
}
