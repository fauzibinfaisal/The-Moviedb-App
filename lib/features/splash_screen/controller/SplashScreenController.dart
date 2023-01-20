import 'dart:async';
import 'package:the_moviedb_app/routes/router.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    startTimeout();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  handleTimeout() {
    changeScreen();
  }

  startTimeout() {
    return new Timer(Duration(seconds: 2), handleTimeout);
  }

  changeScreen() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String sessionName = prefs.getString(Str.sessionUserId) ?? 'null';
    // if (sessionName != "null") {
    //   Get.offNamed('/main');
    // } else {
    //   Get.offNamed('/login');
    // }
    MyRouter.pushPageReplacement("mainPage");
    print("masukkk");
  }
}
