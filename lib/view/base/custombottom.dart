import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tervel_app/util/const/app_color.dart';

class coustombuttom extends StatelessWidget {
  String title;
  final onAction;


  coustombuttom(this.title, this.onAction);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onAction(),
      child: Container(
        decoration: BoxDecoration(
            color: Appcolor.Violetcolor,
            borderRadius: BorderRadius.circular(8)),

        width: 325.w,
        height: 35.h,
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tervel_app/util/const/app_color.dart';
//
// class coustombuttom extends StatelessWidget {
//   String title;
//   final  onAction;
//
//
//   coustombuttom(this.title, this.onAction);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ElevatedButton(
//         onPressed: onAction,
//         child: Text('lkjkl'),
//       )
//     );
//   }
// }
