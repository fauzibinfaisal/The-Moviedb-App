import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_moviedb_app/features/splash_screen/controller/SplashScreenController.dart';
import 'package:the_moviedb_app/values/string.dart';



class SplashScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashScreenController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  height: 160.0.h ,
                  width: 160.0.h ,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Str.imgLogo),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: null,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
