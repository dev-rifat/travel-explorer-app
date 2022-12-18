import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tervel_app/helper/auth_helper.dart';
import 'package:tervel_app/helper/route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tervel_app/util/const/app_color.dart';
import 'package:tervel_app/util/style/images/images.dart';
import 'package:tervel_app/view/base/custom_form_field.dart';
import 'package:tervel_app/view/base/custombottom.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class signInScreen extends StatefulWidget {
  @override
  State<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {
  TextEditingController _usernamecontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  RxBool _value = false.obs;

  final _formKey = GlobalKey<FormState>();
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Appcolor.backgroundcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 70.h,
                        ),
                        Text(
                          'Login\nTo Your Account',
                          style: TextStyle(
                            fontSize: 33.sp,
                            fontWeight: FontWeight.w700,
                            color: Appcolor.primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        customFormField(
                          hintText: 'User name',
                          inputtype: TextInputType.name,
                          controlller: _usernamecontroller,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-z]+$').hasMatch(value!)) {
                              return "Can't be correct";
                            }
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _passwordcontroller,
                            obscureText: value,
                            decoration: InputDecoration(
                                hintText: 'password',
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        value = !value;
                                      });
                                    },
                                    icon: value == true
                                        ? FaIcon(
                                            FontAwesomeIcons.eyeSlash,
                                            size: 15,
                                            color: Colors.grey,
                                          )
                                        : FaIcon(FontAwesomeIcons.eye,
                                            size: 15, color: Colors.grey))),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*\W)")
                                      .hasMatch(value!)) {
                                return "Can't be correct";
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        coustombuttom('Login', () {
                          if (_formKey.currentState!.validate()) {
                            final usernamee = _usernamecontroller.text;
                            final passwords = _passwordcontroller.text;
                            authHelper().logIn(usernamee, passwords, context);
                          }
                        }),
                        SizedBox(
                          height: 15.h,
                        ),
                        Align(
                          //weight center nayar jonno
                          alignment: Alignment.center,
                          child: Text(
                            '--OR--',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w200,
                              color: Appcolor.secondaryHeaderColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.google,
                              width: 40.w,
                              height: 40.h,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              Images.fb,
                              width: 40.w,
                              height: 40.h,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                                text: "Don't have registered yet?",
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: ' Sign Up',
                                      style: TextStyle(
                                          color: Appcolor.Violetcolor,
                                          fontWeight: FontWeight.bold),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.toNamed(signUp);
                                        }),
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
