import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';



class AppService extends GetxService {
  late GetStorage box;
  var isWishListed = false.obs;


  Future<AppService> init() async {
    await GetStorage.init();
    box = GetStorage();
    return this;
  }

  @override
  void onInit() {
    super.onInit();
    isWishListed.value = box.read<bool>('isWishListed') ?? false;
  }

  void setWishListed(bool value) {
    isWishListed.value = value;
    box.write('isWishListed', value);
  }
}
