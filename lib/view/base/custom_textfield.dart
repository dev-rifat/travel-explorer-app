// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:selter_tore_app/const/app_color.dart';
//
// class CustomTextFeild extends StatelessWidget {
//   String hint;
//   final inputtype;
//   final controlller;
//
//   CustomTextFeild(this.hint, this.inputtype, this.controlller);
//   final _fromKey=GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _fromKey,
//       child: Column(
//         children: [
//           TextField(
//             keyboardType: inputtype,
//             controller: controlller,
//             decoration: InputDecoration(
//               filled: false,
//               hintText: hint,
//
//               hintStyle: TextStyle(
//                 fontSize: 15.sp,
//               ),
//               // hintStyle: textStyle.textfilddecoration,
//               focusColor: Appcolor.Violetcolor,
//             ),
//           )
//         ],
//
//
//
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tervel_app/util/const/app_color.dart';

class CustomTextFeild extends StatefulWidget {
  String hint;
  final inputtype;
  final controlller;



  CustomTextFeild(this.hint, this.inputtype, this.controlller,);

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {


  @override
  Widget build(BuildContext context) {
    return Form(

      child: Column(
        children: [
          TextFormField(
            keyboardType: widget.inputtype,
            controller: widget.controlller,
            decoration: InputDecoration(
              filled: false,
              hintText: widget.hint,

              hintStyle: TextStyle(
                fontSize: 15.sp,
              ),
              // hintStyle: textStyle.textfilddecoration,
              focusColor: Appcolor.Violetcolor,
            ),







          )
        ],



      ),
    );
  }
}



class CustomFormField extends StatelessWidget {
  CustomFormField({
    Key? key,
    required this.hintText,
    this.inputFormatters,
    this.validator,
  }) : super(key: key);
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        inputFormatters: inputFormatters,
        validator: validator,
        decoration: InputDecoration(
          filled: false,
          hintText: hintText,

          hintStyle: TextStyle(
            fontSize: 15.sp,
          ),
          // hintStyle: textStyle.textfilddecoration,
          focusColor: Appcolor.Violetcolor,
        ),

      ),
    );
  }
}
