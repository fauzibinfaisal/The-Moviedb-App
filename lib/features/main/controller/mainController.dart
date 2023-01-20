import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainController extends GetxController{
  var x = (Get.width - (Get.width * 0.15)).obs;
  var y = (Get.height - (Get.height * 0.20)).obs;
  var indexBottomNavigation = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }

  onPageChanged(int page) {
    indexBottomNavigation.value = page;
  }

  navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

}
