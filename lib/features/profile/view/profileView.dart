import 'package:the_moviedb_app/components/bodyBuilder.dart';
import 'package:the_moviedb_app/routes/router.dart';
import 'package:the_moviedb_app/values/color.dart';
import 'package:the_moviedb_app/values/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  // final ContactUsController _controller = Get.put(ContactUsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Col.secondColor,
      body: _body(),
    );
  }

  Widget _body(){
    return SafeArea(
        child:
        Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                Str.bgProfile,
                fit: BoxFit.fitWidth,
              ),
            ),
            ListView(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 100.h,
                        ),
                        Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                          ),
                          child: contentBody(),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: Container(
                            height: 150.0.h,
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                            ),
                            child:
                            // CircleAvatar(
                            //   radius: 53,
                            //   backgroundImage: AssetImage(Str.imgDoctor01),
                            // )
                            Image.asset(
                              Str.imgLogo,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        )
    );
  }

  Widget contentBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80.0.h,
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Center(
          child: Text(
            Str.exName,
            style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 24.0.sp,
                fontWeight: FontWeight.w600
            ),
          ),
        ),),
        SizedBox(
          height: 10.0.h,
        ),
        Divider(
          thickness: 5,
          color: Col.secondColor,
        ),
        SizedBox(
          height: 10.0.h,
        ),

        // Container(color: Colors.white, height: Get.height,)
      ],
    );
  }

}
