import 'package:flutter/material.dart';
import 'package:tervel_app/helper/route.dart';
import 'package:tervel_app/view/screen/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // title:AppSting.APP_NAME,

          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme.apply(),
            ),
            // scaffoldBackgroundColor: Appcolor.Scaffoldcolor,
          ),

          initialRoute: splash,
          getPages: getPages,

          home: SplashScreen(),
        );
      },
    );
  }
}
