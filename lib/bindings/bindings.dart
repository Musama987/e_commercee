import 'package:e_commercee/utils/helpers/network_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class UBindings extends Bindings{
  @override
  void dependencies() {
    // ADD THIS LINE TO INITIALIZE THE NETWORK MANAGER
    Get.put(NetworkManager());
  }
}