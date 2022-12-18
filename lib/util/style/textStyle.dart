import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class textStyle{

  TextStyle customStyle=TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp);
  TextStyle subTextStyle=TextStyle(fontWeight: FontWeight.w400,fontSize: 15.sp,color: Colors.grey);


  InputDecoration textfilddecoration(hint)=>InputDecoration(
    hintStyle: TextStyle(fontSize: 15.sp,),
    hintText: hint,

  );
}