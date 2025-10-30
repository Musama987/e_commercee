import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';



class AppService extends GetxService {
  late GetStorage box;


  Future<AppService> init() async {
    await GetStorage.init();
    box = GetStorage();
    return this;
  }

}
