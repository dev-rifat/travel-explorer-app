import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tervel_app/util/const/app_color.dart';
import 'package:tervel_app/util/const/app_string.dart';
import 'package:tervel_app/util/style/images/images.dart';
import 'package:tervel_app/view/screen/onboarding_screen.dart';

import '../../helper/route.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();

  Future chooseScreen() async {
    var userId = box.read('UserData');
    print(userId);
    if (userId == null) {
      Get.toNamed(onborading);
    } else {
      Get.toNamed(home);
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () => chooseScreen());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: Appcolor.backgroundcolor,
        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 135.h,width: 135.w,

                  child: Image(image: AssetImage(Images.logo))),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ Text(
                  AppSting.APP_NAME,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                  Transform.scale(
                      scale: 0.4,
                      child:
                      CircularProgressIndicator(
                        color: Colors.grey,
                      )),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
