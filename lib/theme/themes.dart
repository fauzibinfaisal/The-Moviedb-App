import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_moviedb_app/values/color.dart';

class Themes {

  static ThemeData lightTheme = ThemeData(
    backgroundColor: Col.lightBG,
    primaryColor: Col.lightPrimary,
    focusColor : Col.lightAccent,
    scaffoldBackgroundColor: Col.lightBG,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(
        color: Colors.white,
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w800,
      ),
      unselectedLabelStyle: TextStyle(
        color: Colors.white,
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w800,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Col.lightAccent,
      toolbarTextStyle: TextTheme(
        subtitle1: TextStyle(
          color: Colors.white,
          fontSize: 18.0.sp,
          fontWeight: FontWeight.w800,
        ),
      ).bodyText2, titleTextStyle: TextTheme(
        subtitle1: TextStyle(
          color: Colors.white,
          fontSize: 18.0.sp,
          fontWeight: FontWeight.w800,
        ),
      ).headline6,
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.roboto(fontSize: 25.0.sp, fontWeight: FontWeight.bold, color: Col.primaryColor),
      bodyText1: GoogleFonts.roboto(fontSize: 16.0.sp, color: Col.primaryColor),
      bodyText2: GoogleFonts.roboto(fontSize: 14.0.sp, color: Col.primaryColor),
      button: GoogleFonts.roboto(fontSize: 20.0.sp, color: Color(0xff25A8AB)),
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Col.lightAccent),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Col.darkBG,
    primaryColor: Col.darkPrimary,
    focusColor : Col.darkAccent,
    scaffoldBackgroundColor: Col.darkBG,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(
        color: Colors.white,
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w800,
      ),
      unselectedLabelStyle: TextStyle(
        color: Colors.white,
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w800,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Col.darkAccent,
      toolbarTextStyle: TextTheme(
        subtitle1: TextStyle(
          color: Colors.white,
          fontSize: 18.0.sp,
          fontWeight: FontWeight.w800,
        ),
      ).bodyText2, titleTextStyle: TextTheme(
        subtitle1: TextStyle(
          color: Colors.white,
          fontSize: 18.0.sp,
          fontWeight: FontWeight.w800,
        ),
      ).headline6,
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.roboto(fontSize: 25.0.sp, fontWeight: FontWeight.bold, color: Col.primaryColor),
      bodyText1: GoogleFonts.roboto(fontSize: 16.0.sp, color: Col.primaryColor),
      bodyText2: GoogleFonts.roboto(fontSize: 14.0.sp, color: Col.primaryColor),
      button: GoogleFonts.roboto(fontSize: 20.0.sp, color: Color(0xff25A8AB)),
    ),
  );
}
