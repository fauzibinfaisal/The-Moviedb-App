import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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

              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: <Widget>[
              //     SizedBox(
              //       height: 160.0.h,
              //     ),
              //     Image.asset(
              //       Str.imgWelcomeSplashScreen,
              //       width: 500.0.w,
              //     ),
              //     Image.asset(
              //       Str.appIcon,
              //       width: 500.0.w,
              //     ),
              //   ],
              // ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Container(
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Image.asset(
              //               Str.iconPhone,
              //               width: 40.0.w,
              //             ),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   Str.callCenter,
              //                   style: GoogleFonts.roboto(
              //                     fontSize: Get.textTheme.bodyText1.fontSize,
              //                     color: Colors.white
              //                   ),
              //                 ),
              //                 Text(
              //                   Str.phoneNumber,
              //                   style: GoogleFonts.roboto(
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: Get.textTheme.bodyText1.fontSize,
              //                     color: Colors.white
              //                   ),
              //                 )
              //               ],
              //             )
              //           ],
              //         ),
              //         Padding(
              //           padding: EdgeInsets.only(left: 10.0),
              //           child: Text(
              //             Str.website,
              //             style: GoogleFonts.roboto(
              //                 fontSize: Get.textTheme.bodyText1.fontSize,
              //                 color: Colors.white,
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           height: 10.0.h,
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
