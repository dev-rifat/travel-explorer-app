import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tervel_app/util/const/app_color.dart';

class authCoustomButtom extends StatelessWidget {
  String title;
  final Function onAction;

  authCoustomButtom(this.title, this.onAction,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: ()=>onAction(),
        child: Container(
          decoration: BoxDecoration(
              color: Appcolor.Violetcolor,
              borderRadius: BorderRadius.circular(8)),

          width: 325.w,
          height: 42.h,
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
