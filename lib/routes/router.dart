import 'package:get/get.dart';

class MyRouter{
  static Future? pushPage(String pageName) {
    var val = Get.toNamed(pageName);
    return val;
  }

  static Future? pushPageArguments(String pageName,args) {
    var val = Get.toNamed(pageName, arguments: args);
    return val;
  }

  static backPage() {
    Get.back();
  }

  static pushPageReplacement(String pageName) {
    Get.offNamed(pageName);
  }

  static pushPageReplacementAll(String pageName) {
    Get.offAllNamed(pageName);
  }
}