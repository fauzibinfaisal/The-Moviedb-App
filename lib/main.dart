import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_moviedb_app/theme/themeService.dart';
import 'package:the_moviedb_app/theme/themes.dart';
import 'package:the_moviedb_app/values/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_moviedb_app/routes/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_){
    runApp(MyApp());
  }
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: Str.appName,
        theme: themeData(Themes.lightTheme),
        darkTheme: themeData(Themes.darkTheme),
        themeMode: ThemeService().theme,
        initialRoute: "/",
        // initialRoute: "faqPage",
        getPages: routes(),
        ),
    );
  }

  // Apply font to our app's theme
  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
      textTheme: GoogleFonts.sourceSansProTextTheme(
        theme.textTheme,
      ),
    );
  }
}
