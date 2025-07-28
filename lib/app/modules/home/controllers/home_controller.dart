import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool flag = false.obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      //监听滚动的距离
      if (scrollController.position.pixels > 10) {
        if (flag == false) flag.value = true;
      } else if (scrollController.position.pixels < 10) {
        if (flag == true) flag.value = false;
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
